<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- starting of header -->
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- PAGE settings -->
<link rel="icon" href="#">
<title>Movie Mania</title>
<!-- CSS dependencies -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<!-- linking google font -->
<link
	href="https://fonts.googleapis.com/css?family=Patua+One|Arvo|Fira+Sans|Muli|Slabo+27px|Rubik|Work+Sans|Quicksand|Montserrat|Arimo|Fjalla+One"
	rel="stylesheet">
<!-- linking my css -->
<link rel="stylesheet" href="wireframe1.css">
<link rel="stylesheet" href="mycss.css">
</head>
<!-- ending of header -->
<body>
	<!-- starting of nav bar -->
	<nav class="navbar navbar-custom navbar-expand-lg" id="navbarcolour">
	<a id="textcolourwhite" class="navbar-brand font-weight-bold one"
		href="index.jsp">Movie Mania</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active">
				<button type="button" class="btn margintobutton mon">Home</button>
			</li>
			<li class="nav-item active">
				<button type="button" class="btn margintobutton mon"
					onClick="ShowFavourite()">Show Favorites</button>
			</li>
			<li class="nav-item active">
				<button type="button" class="btn margintobutton mon">Support</button>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<img class="socialicons" src="./image/facebook.png"
				alt="facebook"> <img class="socialicons"
				src="./image/insta.png" alt="insta"> <img
				class="socialicons" src="./image/twitter.png" alt="insta">
		</form>
		<div class="btn-group" role="group" aria-label="Basic example">
			<button type="button" class="btn margintobutton mon">Sign Up</button>
			<button type="button" class="btn margintobutton mon">Log In</button>
		</div>
	</div>
	</nav>
	<!-- ending of nav bar -->

	<!-- container for search box -->
	<div class="container-fluid">
		<div class="row">
			<div class="mx-auto text-center col-md-6">
				<h3 class="display-4 my-3 one">Movie Mania</h3>
				<p class="lead text-secondary rubic">Movie Mania is a wonderful
					website to catch all the hollywood and bollywood movies at a single
					place and watch their trailers to have a glimpse of the movie. If
					you are a movie maniac, then you are at the right place.</p>
			</div>
		</div>
		<form>
			<div class="mx-auto text-center col-md-6">
				<div id="imaginary_container">
					<div class="input-group stylish-input-group">
						<input id="usertext" required type="text" class="form-control"
							placeholder="Search Movie"> <span
							class="input-group-addon">
							<button type ="button" class="btn btn-link my-2 my-sm-0"
								onClick="getData()">
								<i class="fa d-inline fa-lg fa-search text-primary"></i>
							</button>
						</span>

					</div>
				</div>
			</div>
		</form>
		</br> </br>
	</div>
	<!-- container for search box ends -->

	<!-- div to show the response -->
	<div id="favoritesadded">
		<center>
			<h4 id="errormsg" class="one">WELCOME!</h4>
		</center>
	</div>
	<div class="py-5 bg-primary">
		<div class="container">
			<div id="cardcontainerformovie" class="row rubic">
				<center>Easy to use, Provide Access to both hollywood and
					bollywood movies, Search for new movies in real time, Watch good
					quality trailers of the selected movie, Rate the movies and let
					other users see the ratings too, Check the rating for the movie
					before booking the tickets.</center>
			</div>
			<div id="result" class="row"></div>
		</div>
	</div>
	<!-- container to show top reviews -->
	<div class="py-5">
		<div class="container-fluid">
			<div class="row">
				<div class="mx-auto text-center col-md-6">
					<h4 class="mb-3 one">
						<b>Top Reviews</b>
					</h4>
					<div class="carousel slide" data-ride="carousel">
						<div class="carousel-inner bg-light" role="listbox">
							<div class="carousel-item p-5 active">
								<div class="blockquote text-muted mb-0 px-2">
									<p class="mb-0">#1 Review - It occurred to me that I was an
										absolute expert at the product I was pitching I was presenting
										Monetate's products day in and day out to some of the biggest
										brands in the country but people still didn't seem to really
										get it.</p>
									<div class="blockquote-footer">Ms.Falcone</div>
								</div>
							</div>
							<div class="carousel-item p-5">
								<div class="blockquote text-muted mb-0 px-">
									<p class="mb-0">#2 Review - There were a lot of times when
										I felt like my greatest strength was actually holding me
										back,” says Falcone. “When you're an expert on a product,
										you're actually in real danger, because you're much more
										likely to put your.</p>
									<div class="blockquote-footer">Dr.Jojo</div>
								</div>
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleCaptions"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- container to show top reviews ends-->
	<!-- footer starts -->
	<div class="bg-dark py-3">
		<div class="container">
			<div class="row d-flex justify-content-between">
				<div class="col-lg-4 col-md-6">
					<p class="text-secondary mb-0">Copyright - Movie Mania</p>
				</div>
				<div class="col-lg-4 col-md-6">
					<p class="text-secondary mb-0">2018 - All rights reserved by
						the company</p>
				</div>
			</div>
		</div>
	</div>
	<!-- footer ends -->
	<script src="index.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>

</html>
