//variable to store all the info coming from imdb api 
var data;

var poster;
// function to hit imdb api and get the required data
function getData() {
	var xmlHttp = new XMLHttpRequest();
	// retrieving the text from the search box
	var word = document.getElementById("usertext").value;
			var url = "https://api.themoviedb.org/3/search/movie?api_key=628feb1e5d19aa715bd6f0824546c81d&query="
				+ word;
		
		xmlHttp.onreadystatechange = function() {
			 if (this.readyState == 4 && this.status == 200) {
				// storing the response
				var myArr = JSON.parse(this.responseText);
				data = myArr;
				
				for (var i = 0; i < myArr.results.length; i++) {
					var html_code = "<div class='col-lg-8 my-4' style=' background-color: white;'>"
							+ "<h4 id='nameofmovie' class='mb-3 one'><strong>"
							+ data.results[i].title
							+ "</strong></h4>"
							+ "<div class='blockquote text-muted'>"
							+ "<p id='descriptionofmovie' class='mb-0 rubic1'>"
							+ data.results[i].overview
							+ "</p>"
							+ "<div class='row my-2'>"
							+ "<div class='col-3 rubic1'>Release Date-</div>"
							+ data.results[i].release_date
							+ "</div>"
							+ "<div class='row my-2'>"
							+ "<div class='col-3 rubic1'>Rating-</div>"
							+ data.results[i].vote_average
							+ "</div>"
							+ "</div>"
							+ "<button id='favouritebutton"+i+"' class='btn btn-primary my-2' type='button' onClick=addToFav("
							+ i
							+ ") >Add To Favourite</button>"
							+ "</div>"
							+ "<div class='col-md-4 align-self-center my-4'>"
							+ "<img id='posterofmovie' class='img-fluid d-block' src='"
							+ poster + "'> </div>";
					// setting the dynamic card
					document.getElementById('cardcontainerformovie')
							.insertAdjacentHTML('beforeend', html_code);
				}
			}
		};
		// sending request through get method
		xmlHttp.open("GET", url, true);
		xmlHttp.send();
	}
}

// function to add fav movie
function addToFav(i) {
	var xmlhttp = new XMLHttpRequest();
	// setting the movie name added on page in respone
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("errormsg").innerHTML = xmlhttp.responseText;
			document.getElementById("favouritebutton"+i).disabled = true;
		}
	};
	
		
	// values to be sent to servlet
	var params = "moviename=" + data.results[i].title + "&ratings="
			+ data.results[i].vote_average + "&releasedate="
			+ data.results[i].release_date + "&poster="
			+ data.results[i].poster_path + "&overview="
			+ data.results[i].overview;
	// sending data to servlet
	xmlhttp.open('GET', "http://localhost:8082/TatMovie/JsonParsing?"
			+ params, true);
	xmlhttp.send();
}

// function to show fav movie
function ShowFavourite() {

	var xmlhttp = new XMLHttpRequest();

	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			// geting the response in a variable
			var myarr = JSON.parse(this.responseText);
			// showing the response on page
				for (var i = 0; i < myarr.length; i++) {
					// creating dynamic card to show result
					var html_code = "<div class='col-lg-8 my-4' style=' background-color: white;'>"
							+ "<h4 id='nameofmovie' class='mb-3 one'><strong>"
							+ myarr[i].moviename
							+ "</strong></h4>"
							+ "<div class='blockquote text-muted'>"
							+ "<p id='descriptionofmovie' class='mb-0 rubic1'>"
							+ myarr[i].overview
							+ "</p>"
							+ "<div class='row my-2'>"
							+ "<div class='col-3 rubic1'>Release Date-</div>"
							+ myarr[i].releasedate
							+ "</div>"
							+ "<div class='row my-2'>"
							+ "<div class='col-3 rubic1'>Rating-</div>"
							+ myarr[i].ratings
							+ "</div>"
							+ "</div>"
							+ "<button id='removefavouritebutton' class='btn btn-primary my-2' type='button' onClick=removeFromFav("
							+ i
							+ ")>Remove From Favourite</button>"
							+ "</div>"
							+ "<div class='col-md-4 align-self-center my-4'>"
							+ "<img id='posterofmovie' class='img-fluid d-block' src='"
							+ myarr[i].poster + "'> </div>";
					// displaying the dynamic element created
					document.getElementById('result').insertAdjacentHTML(
							'beforeend', html_code);
				}
			}
			
		}
	};
	// making xml call to servlet
	xmlhttp.open('GET', "http://localhost:8082/TatMovie/RetriveFromJson?",
			true);
	xmlhttp.send();
}
// function to remove
function removeFromFav(i) {
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			// showing the response on the page
			document.getElementById("errormsg").innerHTML = xmlhttp.responseText;
			document.getElementById("favouritebutton"+i).disabled = false;
		}
	};
	// values to be sent to servlet
	var params = "index=" + i;
	// sending value by get to servlet
	xmlhttp.open('GET', "http://localhost:8082/TatMovie/RemoveMovie?"
			+ params, true);
	xmlhttp.send();
}
