defmodule Sqlhelper.StaticData.Statements do
  alias Sqlhelper.Tables.{Statements}
  alias Sqlhelper.Repo

  @crime_id 1

  def data(suspect) do
    game_data(suspect)
  end

  defp game_data(suspect) do
    witnesses = Repo.all(Sqlhelper.Tables.Witnesses)
    location = Faker.Address.street_name() <> ", " <> Faker.Address.city()
    date = Faker.Date.backward(7)

    witnesses
    |> Enum.map(fn witness ->
      witness
      |> gen_statement(location, date, suspect)
      |> statements_map(@crime_id, witness.id)
    end)
  end

  defp gen_statement(witness, location, date, suspect) do
    "
    Statement Date: #{Faker.Date.backward(5)}
    Statement Time: #{Enum.random(["9 AM", "9.30 AM", "10 AM", "10.30 AM", "3 PM", "3.30 PM", "4 PM", "4.30 PM"])}

    I, [#{witness.name}], was present at [#{location}] on [#{date}]
    " <> statement_body(witness.id, suspect)
  end

  def statement_body(id, suspect) do
    case id do
      # This should refer to height of the suspect
      1 ->
        "due to my obligation as the event coordinator for a charity auction being held there. My primary duty was to oversee the setup of the auction items and ensure everything was running smoothly.

      Around 7:00 PM, while I was verifying the arrangements in the main hall, I noticed an individual entering the premises from the north entrance. I would estimate around #{suspect.height - 5} to #{suspect.height + 5} cm tall. They were wearing a dark-colored, possibly black or dark grey, trench coat, a hat that shadowed their face, and what appeared to be leather gloves.

      I didn't think much of it at the time as there were many people coming in for the event. However, approximately 40 minutes later, around 7:40 PM, I heard a strange noise emanating from the direction of the east wing of the venue. It sounded like a muffled cry followed by a thud. It was brief and I initially thought it was just the staff moving auction items around. However, the unsettling feeling lingered, prompting me to notify the security personnel.

      I hereby declare that the above statement is true to the best of my knowledge and recollection."

      # This should refer to the hair color of the suspect
      2 ->
        "to attend a charity auction as an invited guest. Around 7:00 PM, while I was enjoying some refreshments in the lounge area, I observed an individual entering the venue through the main entrance. The person had #{suspect.hair_colour} hair and was wearing a dark trench coat and a wide-brimmed hat that covered most of their face. Around 7:40 PM, while I was bidding on an item, I heard a suspicious sound, like something heavy being dragged, coming from the hallway leading to the restrooms. It struck me as odd, prompting a sense of unease."

      # This should refer to ethnicity of the suspect
      3 ->
        "as a volunteer for the charity auction event. Around 7:00 PM, I was stationed near the north entrance when I saw a #{String.downcase(suspect.ethnicity)} individual, entering the venue. They were dressed in a dark-colored trench coat and a hat. Approximately 40 minutes later, I was assisting guests when a sudden chilling scream echoed from the east wing, followed by a silence that was equally unsettling."

      # This should refer to gender of the suspect
      4 ->
        "as part of the security personnel assigned for the charity auction event. At about 7:00 PM, while monitoring the CCTV, I noticed what looked like a #{String.downcase(suspect.gender)}, entering through the north entrance. They were clad in a dark trench coat, and a hat that obscured their face. Around 7:40 PM, I heard a strange noise over the radio from one of the other security personnel near the east wing, describing a sudden cry followed by a thud. "

      # This should refer to age of the suspect
      5 ->
        "as a photographer to cover the charity auction event. I was taking photos near the main entrance around 7:00 PM when I saw individual, roughtly #{get_years(suspect.dob)} years old. They were dressed in a dark trench coat and a hat that cast a shadow over their face. Roughly 40 minutes later, while I was photographing auction items in the east wing, I heard a suspicious noise like a muffled shout followed by a dull thud, which sent a shiver down my spine."

      _ ->
        "I saw nothing Governor!"
    end
  end

  defp get_years(dob) do
    diff_days = Date.diff(Date.utc_today(), dob)
    div(diff_days, 365)
  end

  defp statements_map(statement, crime_id, witness_id) do
    %{
      timestamp: Faker.DateTime.backward(7),
      location_lat: Faker.Address.latitude(),
      location_long: Faker.Address.longitude(),
      statement_text: statement,
      witness_id: witness_id,
      crime_id: crime_id
    }
  end

  def insert(witness_data) do
    witness_data
    |> Enum.map(&Repo.insert!(%Statements{} |> Statements.changeset(&1)))
  end
end
