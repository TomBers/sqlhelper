defmodule Sqlhelper.StaticData.Suspects do
  alias Sqlhelper.Tables.Suspects
  alias Sqlhelper.Repo

  @test_crime 1
  def data do
    # 1..5 |> Enum.map(fn _ -> suspect_map(@test_crime) end)
    game_data(@test_crime)
    |> Enum.map(fn suspect ->
      name = String.split(suspect.name, " ") |> List.first()
      img_path = "/images/suspects/#{name}_1.jpeg"
      Map.put(suspect, :image_path, img_path)
    end)
  end

  defp game_data(crime_id) do
    [
      %{
        name: "Aiden Mercer",
        dob: ~D[1990-12-12],
        height: 188,
        build: "lean yet muscular build",
        hair_colour: "silvery",
        gender: "Male",
        ethnicity: "Mixed Asian and Caucasian heritage",
        notes:
          "Amidst a roster of dubious personas, Aiden Mercer emerges with a blend of intrigue and suspicion swirling around him. Born on December 12, 1990, his towering frame of 6 feet 2 inches commands attention, while his lean yet muscular build suggests a capability for action, perhaps dark deeds. The silvery cascade of his hair, a stark contrast to his age, hints at a life less ordinary, while his mixed Asian and Caucasian heritage paints a picture of a man with a foot in different worlds, whose loyalties may be as complex as the murder enigma that unfolds. A peculiar aura of mystery surrounds Aiden, with whispers about his uncanny ability to read emotions, an eerie talent that raises eyebrows in a setting where every glance exchanged might hold a clue, or a dagger veiled in deceit. In the grand scheme of murder and betrayal, is Aiden Mercer a seeker of truth ensnared in a deadly game, or a mastermind of malevolence hidden in plain sight? The eerie corridors echo with secrets, as the night unveils shadows both outside and within the enigmatic figure of Aiden Mercer.",
        crime_id: crime_id
      },
      %{
        name: "Liliana Sterling",
        dob: ~D[1985-03-08],
        height: 162,
        build: "Slender, elegant build",
        hair_colour: "Raven-black",
        gender: "Female",
        ethnicity: "European",
        notes:
          "Liliana Sterling, with her delicate stature and a penchant for poisonous botany, casts a spell of allure and fear in the aristocratic circles she frequents. Her birth under a veil of secrecy, her raven-black hair, and her slender, elegant build often leave people both enchanted and wary. The whispers about her deadly botanical skills only add to the aura of mystery surrounding her, making her a person of interest in the unfolding murder mystery.",
        crime_id: crime_id
      },
      %{
        name: "Sebastian Blackwood",
        dob: ~D[1988-06-21],
        height: 196,
        build: "Solid",
        hair_colour: "Jet black",
        gender: "Male",
        ethnicity: "English",
        notes:
          "Sebastian Blackwood is an imposing figure whose legacy of wealth and rumored association with clandestine societies precedes him. His solid build and jet black hair reflect a stern demeanor, while his towering height often overshadows others both literally and metaphorically. The chilling rumors about his sinister affiliations make him a suspect in the sinister game where trust is a rare commodity.",
        crime_id: crime_id
      },
      %{
        name: "Valeria Thorn",
        dob: ~D[1991-10-15],
        height: 170,
        build: "Athletic",
        hair_colour: "Fiery red",
        gender: "Female",
        ethnicity: "Celtic",
        notes:
          "Valeria Thorn's fiery red hair and extraordinary skill in ancient ritualistic practices make her a figure of reverence and fear. Her Celtic roots and athletic build reflect a ferocity that matches the intensity of the murder mystery unfolding around her. The enigmatic aura surrounding her ancient practices draws a veil of suspicion, as the deadly game of betrayal takes a mystical turn.",
        crime_id: crime_id
      },
      %{
        name: "Dmitri Ivanov",
        dob: ~D[1986-02-02],
        height: 182,
        build: "Muscular",
        hair_colour: "Blonde",
        gender: "Male",
        ethnicity: "Slavic",
        notes:
          "Dmitri Ivanov, with his cold Slavic features and mastery of chess, maneuvers through the labyrinth of deceit with a mind as sharp as the Siberian cold. His muscular build stands as a fortress amidst the danger that lurks within the shadows of aristocracy. His ability to strategize many moves ahead makes him a formidable player in a deadly game where every move could be fatal.",
        crime_id: crime_id
      },
      %{
        name: "Amara Bellamy",
        dob: ~D[1989-07-07],
        height: 165,
        build: "Petite yet strong",
        hair_colour: "Chestnut",
        gender: "Female",
        ethnicity: "African-American",
        notes:
          "Amara Bellamy, a woman of enigmatic beauty and hypnotic charm, navigates through a realm of aristocratic deceit with a serpent's grace. Her petite yet strong build belies a ferocious strength, while her ability to charm serpents is as mesmerizing as it is terrifying. The veil of mystery surrounding Amara thickens as the night of betrayal reveals serpents both real and metaphorical.",
        crime_id: crime_id
      },
      %{
        name: "Raphael De Luca",
        dob: ~D[1987-08-12],
        height: 185,
        build: "Lean muscle",
        hair_colour: "Dark, wavy",
        gender: "Male",
        ethnicity: "Mediterranean",
        notes:
          "Raphael De Luca, with his smooth Mediterranean charm and rumored ability to unlock any safe, is a man whose innocence is as complex as the locks he deciphers. His lean muscular frame and dark, wavy hair are a testament to his Italian roots, while his enigmatic charisma masks a mind adept at navigating through a world of secrecy and betrayal.",
        crime_id: crime_id
      },
      %{
        name: "Fiona McAllister",
        dob: ~D[1990-04-04],
        height: 167,
        build: "Sturdy and unyielding",
        hair_colour: "Fiery curls",
        gender: "Female",
        ethnicity: "Gaelic",
        notes:
          "Fiona McAllister, a sturdy and unyielding woman of the rugged highlands, is a figure whose Gaelic roots run as deep as the mysteries surrounding her. Her fiery curls and freckled skin are a testament to a lineage steeped in lore and legend. The unsettling knack for being the last person seen with the dearly departed casts a long shadow of doubt on her innocence in a narrative of murder and deceit.",
        crime_id: crime_id
      },
      %{
        name: "Ezra Knight",
        dob: ~D[1988-11-11],
        height: 191,
        build: "Sinewy",
        hair_colour: "Ash-blonde",
        gender: "Male",
        ethnicity: "Anglo-Saxon",
        notes:
          "Ezra Knight, a skilled illusionist, navigates through the veiled corridors of aristocratic deceit with a magician's flair. His sinewy build and ash-blonde hair frame a visage that holds secrets as deep as the illusions he conjures. The shadows of his past profession cast a doubt on his every move, as the line between reality and illusion blurs in a deadly game of murder.",
        crime_id: crime_id
      },
      %{
        name: "Bianca Rios",
        dob: ~D[1992-05-05],
        height: 173,
        build: "Graceful yet lethal",
        hair_colour: "Auburn",
        gender: "Female",
        ethnicity: "Hispanic",
        notes:
          "Bianca Rios, a graceful yet lethal figure, moves through the dark chambers of murder mystery with a dancer's poise and an assassin's precision. Her auburn hair and Hispanic heritage add to the exotic aura that surrounds her, while her silence is a veil that hides realms of secrets waiting to be unraveled in the sinister ballet of betrayal and deceit.",
        crime_id: crime_id
      }
    ]
  end

  # defp suspect_map(crime_id) do
  #   %{
  #     name: Faker.Person.name(),
  #     dob: Faker.Date.between(~D[1971-01-01], ~D[2008-01-01]),
  #     height: Enum.random(["Short", "Tall", "Average"]),
  #     build: Enum.random(["Strong", "Weak", "Medium", "Massive", "Unusual", "Meager"]),
  #     hair_colour: Enum.random(["Black", "Red", "Blonde", "Brown", "Grey", "White", "Bald"]),
  #     ethnicity:
  #       Enum.random([
  #         "Asian, Asian British, Asian Welsh",
  #         "Black, Black British, Black Welsh, Caribbean or African",
  #         "Mixed or Multiple",
  #         "White",
  #         "Other ethnic group"
  #       ]),
  #     notes: Faker.Superhero.power(),
  #     crime_id: crime_id
  #   }
  # end

  def insert(suspect_data) do
    IO.inspect(suspect_data, label: "suspect_data")

    suspect_data
    |> Enum.map(&Repo.insert!(%Suspects{} |> Suspects.changeset(&1)))
  end
end
