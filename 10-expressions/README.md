**Task 1: for Expression with List**
1. Create two variables, numbers_list and objects_list. The type of numbers_list is a list of numbers, and the type of objects_list is a list of objects, each containing firstname and lastname properties as strings.
2. Create a local named double_numbers is created. This local contains a list of numbers from numbers_list, each doubled.
3. Create a local named even_numbers is created. This local contains a list of only the even numbers from numbers_list.
4. Create a local named firstnames is created. This local contains a list of all the first names from objects_list.
5. Create a local named fullnames is created. This local contains a list of concatenated first and last names from objects_list.

**Task 2: for Expression with Map**
1. Create a variable numbers_map of type map(number). This will be the map on which we operate.
2. Create a local doubles_map. This local consists of each key-value pair in numbers_map, but with each value doubled.
3. Create a local even_map. This local consists of each key-value pair in numbers_map, but only if the value is even. Each value should also be doubled.
4. Output the results of doubles_map and even_map. Running the terraform plan command will allow you to visualize these outputs.

**Task 3: Transforming Lists into Maps and Vice Versa**
1. Create a users variable, which receives a list of objects, with each object containing a username and role properties.
2. Create a users_map local, which transforms the var.users list into a map where the username property becomes the key in the map, and the role property becomes the value.
- The users_map local should also handle duplicated usernames and return a list of roles whenever a username appears more than once in the users variable.
3. Create a users_map2 local, which transforms our local.users_map into a new map with the following structure: <key> => { roles = <roles list> }.
4. Create a user_to_output variable, which receives a string used to retrieve a specific user’s information from our users_map2 local.
5. Create a usernames_from_map local, which transforms the local.users_map map into a list containing only the username of each map entry.
6. Define outputs to visualize the information we have been processing so far.

