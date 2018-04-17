require 'json/ext'
require 'pry'

$colors = ["#34495e", "#1abc9c","#2ecc71","#3498db","#9b59b6","#16a085","#27ae60","#2980b9","#8e44ad","#2c3e50","#f1c40f","#e67e22","#e74c3c","#7f8c8d","#f39c12","#d35400","#c0392b","#6c5ce7","#00b894","#5f27cd","#341f97","#1e3799","#079992","#ED4C67","#0652DD","#833471","#009432"];

def generate_for_home
	menu = {
		"Home":{},
		"Newest Strains":{nav: "json"},
		"Popular strains":{nav: "json"},
		"Moods & Activities":{nav: "json"},
		"Medical":{nav: "json"},
		"Category":{nav: "json"},
		"Flavors":{nav: "json"},
		"Effects":{nav: "json"},
		"Symptoms":{nav: "json"},
		"Conditions":{nav: "json"},
		"About":{nav: "link",url:"http://www.f22labs.com/"}
	}
	config = []
	menu.each do |key,value|
		data = {"title":key}
		if(value["image"])
			data[:background] = {"image": value["imge"]}
		else
			data[:background] = {"color": $colors.sample}
		end

		if(value[:nav]=="json")
			data[:onClick] = {"page": "#{key.downcase.to_s.gsub(/[^0-9a-z ]/i, '').gsub(" ","")}.json"}
		elsif(value["nav"]=="link")
			data[:onClick] = {"url": "#{value['url']}.json"}
		end


		config << data;
	end
	page = {title:"Home", "data":config }

	File.open("newhome.json", 'w') { |file| file.write(JSON.pretty_generate(page)) }
end

def generate_for_flavors
	names = ["Link","Ammonia","Apple","Apricot","Berry","Blue Cheese","Blueberry","Butter","Cheese","Chemical","Chestnut","Citrus","Coffee","Diesel","Earthy","Flowery","Grape","Grapefruit","Honey","Lavender","Lemon","Lime","Mango","Menthol","Mint","Nutty","Orange","Peach","Pear","Pepper","Pine","Pineapple","Plum","Pungent","Rose","Sage","Skunk","Spicy/Herbal","Strawberry","Sweet","Tar","Tea","Tobacco","Tree Fruit","Tropical","Vanilla","Violet","Woody"]
	
	config = []
	names.each do |name|
		data = {"title":name, "background":{"color": $colors.sample}}
		config << data;
	end
	page = {title:"Flavors", "data":config }

	File.open("flavors.json", 'w') { |file| file.write(JSON.pretty_generate(page)) }
end

def generate_for_category
	category = ["Hybrid","Indica","Sativa"];
	
	config = []
	category.each do |name|
		data = {"title":name, "background":{"image": "https://s3.amazonaws.com/herbie-images/#{name.downcase}.png"}}
		config << data;
	end
	page = {title:"Category", "data":config }

	File.open("category.json", 'w') { |file| file.write(JSON.pretty_generate(page)) }
end

generate_for_home