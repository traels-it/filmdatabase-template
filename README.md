# Filmdatabase Code Challenge

Opgaven er at lave en filmdatabase, som fungerer som opslagsværk over de film man godt kan lide. Man skal kunne oprette film, tilføje plakater og lave integration til en filmdatabase, som kan trække information ud om hver film.

> Opgaven er designet så den kan løses på et par timer, men alle starter et forskelligt sted, i forhold til evner og erfaring. Hvis du er helt ny til Ruby og Rails er det helt okay, hvis du ender med at bruge lidt længere tid end forventet.
> 
> Vi bruger Replit som online kodemiljø, sådan at du ikke skal bruge kræfter på at installere Ruby og Rails lokalt på din egen computer. Din applikation kan skrives og køres direkte fra Replit (se _Rails on Replit_-afsnittet i bunden af guiden for flere detaljer).

## Features

### Backend
- Integration til en åben filmdatabase: [https://www.omdbapi.com](https://www.omdbapi.com/) (_Man skal bruge en API-nøgle til OMDb, når man integrerer. De uddeler kun 1.000 nøgler om dagen, så hvis det ikke lykkedes dig at få en, kan du (forhåbentlig) bruge denne: **7086c3d6**_)
- Der skal være en side til at vise alle de film man har oprettet
- Der skal være en side til at oprette en ny film til samlingen
- Der skal være en side til at redigere en film i samlingen
- Det skal være muligt at slette en film fra samlingen
- Der skal være en side til at præsentere filmen
*Titlen på filmen, et billede af filmplakaten, og lidt information trukket fra filmdatabasen (ingen krav om antal, kunne f.eks. være udgivelsesår, genre, skuespillere, osv.)*

### Frontend
- Applikationen er allerede forudinstalleret med [Bootstrap 5](https://getbootstrap.com/docs/5.1/getting-started/introduction/).
- Der er ikke nogle krav til æstetikken af frontenden. Applikationen skal blot være funktionel, og facilitere de krav der er nævnt under _Backend_-afsnittet.

### Tests
- **System test**:
*Vi vil rigtig gerne se en system-test der kører igennem at oprette en film i databasen. Testen må gerne vise både flowet til oprettelsen af en film samt at kaldet til API'et har fået hentet de rigtige data.*
- **Integration og model test (*valgfri*)**:
*En model test der viser de metoder der måtte blive oprettet på modellerne, og en integration test der viser at kaldet til hver controller action går som de skal.*

## Aflevering af opgaven
Send dit Replit link til job@traels.it senest dagen før samtalen.

## Hjælp og resourcer
> Hvis det er første gang at du arbejder med Ruby og Rails, er her en samling af links der kan være nyttige, til at komme godt i gang.

* [Den officielle "Getting Started" guide til Rails](https://guides.rubyonrails.org/getting_started.html)
* [Ruby gem til integration med OMDb](https://github.com/nikkypx/omdb-api)

## Rails on Replit

This is a template to get you started with Rails on Replit. It's ready to go so you can just hit run and start coding!

This template was generated using `rails new` (after you install the `rails` gem from the packager sidebar) so you can always do that if you prefer to set it up from scratch. The only had two make config changes we had to make to run it on Replit:

- bind the app on `0.0.0.0` instead of `localhost` (see `.replit`)
- allow `*.repl.co` hosts (see `config/environments/development.rb`)
- allow the app to be iframed on `replit.com` (see `config/application.rb`)

### Running the app

Simple hit run! You can edit the run command from the `.replit` file.

### Running commands

Start every command with `bundle exec` so that it runs in the context of the installed gems environment. The console pane will give you output from the server but you can run arbitrary command from the shell without stopping the server.

### Database

SQLite would work in development but we don't recommend running it in production. Instead look into using the built-in [Replit database](http://docs.replit.com/misc/database). Otherwise you are welcome to connect databases from your favorite provider. 

### Help

If you need help you might be able to find an answer on our [docs](https://docs.replit.com) page. Alternatively you can [ask in the community](https://replit.com/talk/ask). Feel free to report bugs [here](https://replit.com/bugs) and give us feedback [here](https://Replit/feedback).
