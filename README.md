# Ice Cream Social

This is a social way to keep track of ice cream brands and flavors you've tried and rate how you liked them. 

Models:

- User 
	- username
	- password
	- has_many reviews
	- has_many ice_creams through reviews

	Brand
	- name
	- in_grocery boolean
	- has_many ice_creams

	Ice_cream
	- belongs_to brand
	- belongs_to user
	- flavor
	- description
	- has_many review
	- has_many users, through reviews

	Reviews
	- Ice_cram_id
	- User_id
	- Stars
	- Title
	- content
	