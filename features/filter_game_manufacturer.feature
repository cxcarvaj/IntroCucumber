# language: en

Feature: Search games by manufacturer
      
  @gamesByManufacturer
  Scenario: Filter games by manufacturer
      Given a set of games
     | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
     | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
     | Splatoon                   | 2016         | Nintendo             | T      |
     | Super Smash Bros. Ultimate | 2018         | Bandai Namco Studios | E      |
     | The Last of Us             | 2013         | Naughty Dog          | M      |
     | The Last of Us 2           | 2013         | Naughty Dog          | M      |
      Given the user enters the study: Naughty Dog
      When the user search games by study
      Then 2 games will match
      And the names of these games are
      | NAME                       |
      | The Last of Us             |
      | The Last of Us 2           |
      And the following message is displayed: 2 games developed by: Naughty Dog were found.
  
  @gamesByManufacturer
  Scenario: Filter games by manufacturer
      Given a set of games
     | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
     | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
     | Splatoon                   | 2016         | Nintendo             | T      |
     | Super Smash Bros. Ultimate | 2018         | Bandai Namco Studios | E      |
     | The Last of Us             | 2013         | Naughty Dog          | M      |
     | The Last of Us 2           | 2013         | Naughty Dog          | M      |
      Given the user enters the study: Nintendo
      When the user search games by study
      Then 1 games will match
      And the names of these games are
      | NAME                       |
      | Splatoon                   |
      And the following message is displayed: A game developed by Nintendo was found.

  @gamesByManufacturer
  Scenario: Filter games by manufacturer without finding any match
      Given a set of games
     | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
     | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
     | Splatoon                   | 2016         | Nintendo             | T      |
     | Super Smash Bros. Ultimate | 2018         | Bandai Namco Studios | E      |
     | The Last of Us             | 2013         | Naughty Dog          | M      |
     | The Last of Us 2           | 2013         | Naughty Dog          | M      |
      Given the user enters the study: Santa Monica
      When the user search games by study
      Then 0 games will match
      And the following message is displayed: No game developed by Santa Monica was found