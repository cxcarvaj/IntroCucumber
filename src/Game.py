class Game(object):
	"""Class Game"""

	def __init__(self, name, release, developer, rating):
		
		self.name = name
		self.release=release
		self.developer = developer
		self.rating = rating

	def __str__(self):
		return self.name

	def full_info(self):
		game_str = self.name + "| Release Date: "+self.release +" | Developer: " + self.developer + " | Rating:  " + self.rating
		return game_str
