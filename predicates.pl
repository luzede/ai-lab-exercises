/* 1A:
This is the world of predicates. Here, we define the predicates that will be used in the program.
Genre: genre(Movie, Genre) - Movie is a movie and Genre is the genre of Movie.
Director: director(Movie, Director) - Movie is a movie and Director is the director of Movie.
Keyword: plot_keyword(Movie, Keyword) - Movie is a movie and Keyword is a keyword in the plot of Movie.
Actor: actor(Movie, Actor) - Movie is a movie and Actor is an actor in Movie.
Language: language(Movie, Language) - Movie is a movie and Language is the language of Movie.
Colored_Or_Not: plot_keyword(Movie, "black and white") - Movie is a black and white movie| Using control f we find in dataset that "black and white" is a plot_keyword.
Production_Studio: production_company(Movie, Company) - Movie is a movie and Company is the production company of Movie.
Production_Country: country(Movie, Country) - Movie is a movie and Country is the country of Movie.
Decade: decade(Movie, Decade) - Movie is a movie and Decade is the decade of Movie. | title year is used to find the decade of the movie.
*/

%for common genres (some keywords common)

common_genre(Movie1, Movie2, Genre) :- genre(Movie1, Genre), genre(Movie2, Genre), Movie1 \= Movie2.
at_least_one_common_genre(Movie1, Movie2) :- common_genre(Movie1, Movie2, Genre).
at_least_two_common_genres(Movie1, Movie2) :- common_genre(Movie1, Movie2, Genre1), common_genre(Movie1, Movie2, Genre2), Genre1 \= Genre2.
at_least_three_common_genres(Movie1, Movie2) :- common_genre(Movie1, Movie2, Genre1), common_genre(Movie1, Movie2, Genre2), common_genre(Movie1, Movie2, Genre3), Genre1 \= Genre2, Genre1 \= Genre3, Genre2 \= Genre3.
at_least_four_common_genres(Movie1, Movie2) :- common_genre(Movie1, Movie2, Genre1), common_genre(Movie1, Movie2, Genre2), common_genre(Movie1, Movie2, Genre3), common_genre(Movie1, Movie2, Genre4), Genre1 \= Genre2, Genre1 \= Genre3, Genre1 \= Genre4, Genre2 \= Genre3, Genre2 \= Genre4, Genre3 \= Genre4.

exactly_one_common_genre(Movie1, Movie2) :- 
    common_genre(Movie1, Movie2, Genre),
    \+ (common_genre(Movie1, Movie2, Genre2), Genre2 @< Genre).

exactly_three_common_genres(Movie1, Movie2) :- 
    common_genre(Movie1, Movie2, Genre1), 
    common_genre(Movie1, Movie2, Genre2), 
    common_genre(Movie1, Movie2, Genre3),
    Genre1 @< Genre2, Genre2 @< Genre3,
    \+ (common_genre(Movie1, Movie2, Genre4), Genre4 \= Genre1, Genre4 \= Genre2, Genre4 \= Genre3).

%for same director

same_director(Movie1, Movie2) :- director(Movie1, Director), director(Movie2, Director), Movie1 \= Movie2.

%for same plot (some plot keywords common)
common_plot_keyword(Movie1, Movie2, Keyword) :- plot_keyword(Movie1, Keyword), plot_keyword(Movie2, Keyword), Movie1 \= Movie2.
at_least_one_common_keyword(Movie1, Movie2) :- common_plot_keyword(Movie1, Movie2, Keyword).
at_least_two_common_keywords(Movie1, Movie2) :- common_plot_keyword(Movie1, Movie2, Keyword1), common_plot_keyword(Movie1, Movie2, Keyword2), Keyword1 \= Keyword2.
at_least_three_common_keywords(Movie1, Movie2) :- common_plot_keyword(Movie1, Movie2, Keyword1), common_plot_keyword(Movie1, Movie2, Keyword2), common_plot_keyword(Movie1, Movie2, Keyword3), Keyword1 \= Keyword2, Keyword1 \= Keyword3, Keyword2 \= Keyword3.
at_least_four_common_keywords(Movie1, Movie2) :- common_plot_keyword(Movie1, Movie2, Keyword1), common_plot_keyword(Movie1, Movie2, Keyword2), common_plot_keyword(Movie1, Movie2, Keyword3), common_plot_keyword(Movie1, Movie2, Keyword4), Keyword1 \= Keyword2, Keyword1 \= Keyword3, Keyword1 \= Keyword4, Keyword2 \= Keyword3, Keyword2 \= Keyword4, Keyword3 \= Keyword4.

exactly_three_common_keywords(Movie1, Movie2) :- 
    common_plot_keyword(Movie1, Movie2, Keyword1), 
    common_plot_keyword(Movie1, Movie2, Keyword2), 
    common_plot_keyword(Movie1, Movie2, Keyword3),
    Keyword1 @< Keyword2, Keyword2 @< Keyword3,
    \+ (common_plot_keyword(Movie1, Movie2, Keyword4), Keyword4 \= Keyword1, Keyword4 \= Keyword2, Keyword4 \= Keyword3).

exactly_five_common_keywords(Movie1, Movie2) :- 
    common_plot_keyword(Movie1, Movie2, Keyword1), 
    common_plot_keyword(Movie1, Movie2, Keyword2), 
    common_plot_keyword(Movie1, Movie2, Keyword3),
    common_plot_keyword(Movie1, Movie2, Keyword4),
    common_plot_keyword(Movie1, Movie2, Keyword5),
    Keyword1 @< Keyword2, Keyword2 @< Keyword3, Keyword3 @< Keyword4, Keyword4 @< Keyword5,
    \+ (common_plot_keyword(Movie1, Movie2, Keyword6), Keyword6 \= Keyword1, Keyword6 \= Keyword2, Keyword6 \= Keyword3, Keyword6 \= Keyword4, Keyword6 \= Keyword5).


%for same three actors
common_actor(Movie1, Movie2, Actor) :- actor(Movie1, Actor), actor(Movie2, Actor), Movie1 \= Movie2.
at_least_one_common_actor(Movie1, Movie2) :- common_actor(Movie1, Movie2, Actor1).
at_least_two_common_actors(Movie1, Movie2) :- common_actor(Movie1, Movie2, Actor1), common_actor(Movie1, Movie2, Actor2), Actor1 \= Actor2.
at_least_three_common_actors(Movie1, Movie2) :- common_actor(Movie1, Movie2, Actor1), common_actor(Movie1, Movie2, Actor2), common_actor(Movie1, Movie2, Actor3), Actor1 \= Actor2, Actor1 \= Actor3, Actor2 \= Actor3.

exactly_one_common_actor(Movie1, Movie2) :-
    common_actor(Movie1, Movie2, Actor1),
    \+ (common_actor(Movie1, Movie2, Actor2), Actor2 @< Actor1).

exactly_two_common_actors(Movie1, Movie2) :-
    common_actor(Movie1, Movie2, Actor1),
    common_actor(Movie1, Movie2, Actor2),
    Actor1 @< Actor2,
    \+ (common_actor(Movie1, Movie2, Actor3), Actor3 \= Actor1, Actor3 \= Actor2).

%for same language
same_language(Movie1, Movie2) :- language(Movie1, Language), language(Movie2, Language), Movie1 \= Movie2.

%for black and white movies | it can be 'Color' or 'black_and_white'
black_and_white(Movie,Color) :- color(Movie,Color).

%for common production company
common_production_company(Movie1, Movie2, Company) :- production_company(Movie1, Company), production_company(Movie2, Company), Movie1 \= Movie2.

%for common country
common_country(Movie1, Movie2, Country) :- country(Movie1, Country), country(Movie2, Country), Movie1 \= Movie2.

%for same decade
same_decade(Movie1, Movie2, Decade) :- decade(Movie1, Decade), decade(Movie2, Decade), Movie1 \= Movie2.