require 'json/ext'

names = ["Link","Ammonia","Apple","Apricot","Berry","Blue Cheese","Blueberry","Butter","Cheese","Chemical","Chestnut","Citrus","Coffee","Diesel","Earthy","Flowery","Grape","Grapefruit","Honey","Lavender","Lemon","Lime","Mango","Menthol","Mint","Nutty","Orange","Peach","Pear","Pepper","Pine","Pineapple","Plum","Pungent","Rose","Sage","Skunk","Spicy/Herbal","Strawberry","Sweet","Tar","Tea","Tobacco","Tree Fruit","Tropical","Vanilla","Violet","Woody"]
colors = ["#34495e", "#1abc9c","#2ecc71","#3498db","#9b59b6","#16a085","#27ae60","#2980b9","#8e44ad","#2c3e50","#f1c40f","#e67e22","#e74c3c","#7f8c8d","#f39c12","#d35400","#c0392b","#6c5ce7","#00b894","#5f27cd","#341f97","#1e3799","#079992","#ED4C67","#0652DD","#833471","#009432"];
config = []
names.each do |name|
	data = {"title":name, "background":{"color": colors.sample}}
	config << data;
end
page = {title:"Flavors", "data":config }

File.open("flavors.json", 'w') { |file| file.write(JSON.pretty_generate(page)) }
