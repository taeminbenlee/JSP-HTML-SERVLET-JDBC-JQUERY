<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
body {
    background:#333;
}
#login {
	-webkit-perspective: 1000px;
	-moz-perspective: 1000px;
	perspective: 1000px;
	margin-top:50px;
	margin-left:30%;
}
.login {
	font-family: 'Josefin Sans', sans-serif;
	-webkit-transition: .3s;
	-moz-transition: .3s;
	transition: .3s;
	-webkit-transform: rotateY(40deg);
	-moz-transform: rotateY(40deg);
	transform: rotateY(40deg);
}
.login:hover {
	-webkit-transform: rotate(0);
	-moz-transform: rotate(0);
	transform: rotate(0);
}
.login article {
	
}
.login .form-group {
	margin-bottom:17px;
}
.login .form-control,
.login .btn {
	border-radius:0;
}
.login .btn {
	text-transform:uppercase;
	letter-spacing:3px;
}
.input-group-addon {
	border-radius:0;
	color:#fff;
	background:#f3aa0c;
	border:#f3aa0c;
}
.forgot {
	font-size:16px;
}
.forgot a {
	color:#333;
}
.forgot a:hover {
	color:#5cb85c;
}

#inner-wrapper, #contact-us .contact-form, #contact-us .our-address {
    color: #1d1d1d;
    font-size: 19px;
    line-height: 1.7em;
    font-weight: 300;
    padding: 50px;
    background: #fff;
    box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
    margin-bottom: 100px;
}
.input-group-addon {
    border-radius: 0;
        border-top-right-radius: 0px;
        border-bottom-right-radius: 0px;
    color: #fff;
    background: #f3aa0c;
    border: #f3aa0c;
        border-right-color: rgb(243, 170, 12);
        border-right-style: none;
        border-right-width: medium;
}
</style>
</head>
<body>
<p>myRegi</p>
<h1>회원가입</h1>
<form action="my_register" method="post">
	<div class="col-md-4 col-md-offset-4" id="login">
		<section id="inner-wrapper" class="login">
			<article>
							
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user"> </i></span>
						<input type="text" class="form-control" name="name" id="name" placeholder="Name">
						
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-envelope"> </i></span>
						<input type="email" class="form-control" name="email" placeholder="Email Address">
						<p id="idcheck" style="font-size: 8px"></p>
						<input type="button" id="btn" value="email 확인">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-key"> </i></span>
						<input type="password" name="pwd" id="_pwd" class="form-control" placeholder="Password">
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-key"> </i></span>
						<input type="password" class="form-control" placeholder="Confirm Password">
					</div>
				</div>
				<button type="submit" class="btn btn-success btn-block">Submit</button>
							
			</article>
		</section>
	</div>
</form>

</body>
</html>