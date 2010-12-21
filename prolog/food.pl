food_type(velveeta, cheese).
food_type(ritz, cracker).
food_type(spam, meat).
food_type(sausage, meat).
food_type(jolt, soda).
food_type(twinkie, dessert).

flavor(sweet, dessert).
flavor(savory, meet).
flavor(savour, cheese).
flavour(sweet, soda).

food_flavor(X, Y) :- food_type(X, Z), flavour(Y, Z).

