<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>
<link rel="stylesheet" href="/resource/common.css" />
<script src="/resource/common.js" defer="defer"></script>
<!-- 테일윈드 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" />

<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- 구글 폰트 불러오기  -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<section class="mt-8 text-xl px-4">
		<div class="mx-auto">
			<form action="../member/doJoin" method="POST">
				<table class="join-box table-box-1" border="1">
					<tbody>
						<tr>
							<th>아이디</th>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
									placeholder="아이디를 입력해주세요" name="loginId" />
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
									placeholder="비밀번호를 입력해주세요" name="loginPw" />
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
									placeholder="이름을 입력해주세요" name="name" />
							</td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
									placeholder="닉네임을 입력해주세요" name="nickname" />
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
									placeholder="전화번호를 입력해주세요" name="cellphoneNum" />
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
									placeholder="이메일을 입력해주세요" name="email" />
							</td>
						</tr>

						<tr>
							<th></th>
							<td>
								<input class="btn btn-outline btn-info" type="submit" value="가입" />
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="btns">
				<button class="btn btn-outline" class="" type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
</body>
</html>