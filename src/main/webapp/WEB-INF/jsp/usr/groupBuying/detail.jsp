<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- <iframe src="http://localhost:8081/usr/groupBuying/doIncreaseHitCountRd?id=372" frameborder="0"></iframe> -->
<script>
	const params = {};
	params.id = parseInt('${param.id}');

	var isAlreadyAddGroupBuyingGoodRp = ${isAlreadyAddGroupBuyingGoodRp};
	var isAlreadyAddGroupBuyingBadRp = ${isAlreadyAddGroupBuyingBadRp};
	var isAlreadyAddCommentGoodRp = ${isAlreadyAddCommentGoodRp};
	var isAlreadyAddCommentBadRp = ${isAlreadyAddCommentBadRp};
</script>

<script>
	function GroupBuyingDetail__doIncreaseHitCount() {
		const localStorageKey = 'groupBuying__' + params.id + '__alreadyView';

		if (localStorage.getItem(localStorageKey)) {
			return;
		}

		localStorage.setItem(localStorageKey, true);

		$.get('../groupBuying/doIncreaseHitCountRd', {
			id : params.id,
			ajaxMode : 'Y'
		}, function(data) {
			$('.groupBuying-detail__hit-count').empty().html(data.data1);
		}, 'json');
	}

	$(function() {
		// 		GroupBuyingDetail__doIncreaseHitCount();
		setTimeout(GroupBuyingDetail__doIncreaseHitCount, 2000);
	})
</script>

<!-- 게시글 좋아요 싫어요 기능 -->

<script>
	function checkAddGroupBuyingRpBefore() {
    <!-- 변수값에 따라 각 id가 부여된 버튼에 클래스 추가(이미 눌려있다는 색상 표시) -->
		if (isAlreadyAddGroupBuyingGoodRp == true) {
			$("#add-groupBuying-goodRp-btn").addClass("already-added");
		} else if (isAlreadyAddGroupBuyingBadRp == true) {
			$("#add-groupBuying-badRp-btn").addClass("already-added");
		} else {
			return;
		}
	};
</script>

<!-- 리액션 실행 코드 -->
<script>
	$(document).ready(function() {
		<!-- 각 id가 부여된 버튼 클릭 시 로그인 요청 메시지 발송 -->
        $("#request-login-good").click(function() {
			alert('로그인 후 이용해주세요!');
			return;
		});
		$("#request-login-bad").click(function() {
			alert('로그인 후 이용해주세요!');
			return;
		});
        
        <!-- jsp 실행 이전의 리액션 여부 체크 및 버튼 색상 표현 -->
		$(function() {
			checkAddGroupBuyingRpBefore();
		});
        
        <!-- 좋아요 버튼 클릭 이벤트 및 ajax 실행 -->
		$("#add-groupBuying-goodRp-btn,#add-groupBuying-heart-btn").click(function() {
			
            <!-- 이미 싫어요가 눌려 있는 경우 반려 -->
            if (isAlreadyAddGroupBuyingBadRp == true) {
				alert('이미 싫어요를 누르셨습니다.');
				return;
			}
            
            <!-- 좋아요가 눌려 있지 않은 경우 좋아요 1 추가 -->
			if (isAlreadyAddGroupBuyingGoodRp == false) {
				$.ajax({
					url : "/usr/reactionPoint/increaseGoodRp",
					type : "POST",
					data : { relTypeCode: 'groupBuying', id : params.id },
					success : function(goodReactionPoint) {
						$("#add-groupBuying-goodRp-btn").addClass("already-added");
						$("#add-groupBuying-heart-btn").addClass("already-added");
						$(".add-groupBuying-goodRp").html(goodReactionPoint);
						$(".add-groupBuying-heart").html(goodReactionPoint);
						isAlreadyAddGroupBuyingGoodRp = true;
					},
					error : function() {
						alert('서버 에러, 다시 시도해주세요.');
					}
				});
                
              <!-- 이미 좋아요가 눌려 있는 경우 좋아요 1 감소 -->  
			} else if (isAlreadyAddGroupBuyingGoodRp == true){
				$.ajax({
					url : "/usr/reactionPoint/decreaseGoodRp",
					type : "POST",
					data : { relTypeCode: 'groupBuying', id : params.id },
					success : function(goodReactionPoint) {
						$("#add-groupBuying-goodRp-btn").removeClass("already-added");
						$("#add-groupBuying-heart-btn").removeClass("already-added");
						$(".add-groupBuying-goodRp").html(goodReactionPoint);
						$(".add-groupBuying-heart").html(goodReactionPoint);
						isAlreadyAddGroupBuyingGoodRp = false;
					},
					error : function() {
						alert('서버 에러, 다시 시도해주세요.');
					}
				});
			} else {
				return;
			}
		});
        
        <!-- 싫어요 버튼 클릭 이벤트 및 ajax 실행 -->
		$("#add-badRp-btn").click(function() {
			
            <!-- 이미 좋아요가 눌려 있는 경우 반려 -->
            if (isAlreadyAddGroupBuyingGoodRp == true) {
				alert('이미 좋아요를 누르셨습니다.');
				return;
			}
            
            <!-- 싫어요가 눌려 있지 않은 경우 싫어요 1 추가 -->
			if (isAlreadyAddGroupBuyingBadRp == false) {
				$.ajax({
					url : "/usr/reactionPoint/increaseBadRp",
					type : "POST",
					data : { relTypeCode: 'groupBuying', id : params.id },
					success : function(badReactionPoint) {
						$("#add-groupBuying-badRp-btn").addClass("already-added");
						$(".add-groupBuying-badRp").html(badReactionPoint);
						isAlreadyAddGroupBuyingBadRp = true;
					},
					error : function() {
						alert('서버 에러, 다시 시도해주세요.');
					}
				});
                
              <!-- 이미 싫어요가 눌려 있는 경우 싫어요 1 감소 --> 
			} else if (isAlreadyAddGroupBuyingBadRp == true) {
				$.ajax({
					url : "/usr/reactionPoint/decreaseBadRp",
					type : "POST",
					data : { relTypeCode: 'groupBuying', id : params.id },
					success : function(badReactionPoint) {
						$("#add-groupBuying-badRp-btn").removeClass("already-added");
						$(".add-groupBuying-badRp").html(badReactionPoint);
						isAlreadyAddGroupBuyingBadRp = false;
					},
					error : function() {
						alert('서버 에러, 다시 시도해주세요.');
					}
				});
			} else {
				return;
			}
		});
		
	});		
	
	    
	    
</script>

<!-- 댓글 좋아요 싫어요 기능 -->
<script>

function checkAddCommentRpBefore() {
    <!-- 변수값에 따라 각 id가 부여된 버튼에 클래스 추가(이미 눌려있다는 색상 표시) -->
		if (isAlreadyAddCommentGoodRp == true) {
			$("#add-comment-goodRp-btn").addClass("already-added");
		} else if (isAlreadyAddCommentBadRp == true) {
			$("#add-comment-badRp-btn").addClass("already-added");
		} else {
			return;
		}
	};

	$(document).ready(function() {
		
		
		<!-- 각 id가 부여된 버튼 클릭 시 로그인 요청 메시지 발송 -->
        $("#request-login-good").click(function() {
			alert('로그인 후 이용해주세요!');
			return;
		});
		$("#request-login-bad").click(function() {
			alert('로그인 후 이용해주세요!');
			return;
		});
        
        <!-- jsp 실행 이전의 리액션 여부 체크 및 버튼 색상 표현 -->
		$(function() {
			checkAddCommentRpBefore();
		});
        
        <!-- 좋아요 버튼 클릭 이벤트 및 ajax 실행 -->
		$("#add-comment-goodRp-btn").click(function() {
			console.log(1);
            <!-- 이미 싫어요가 눌려 있는 경우 반려 -->
            var commentId = $(this).parent().prev().prev().prev().prev().children().val(); 
            if (isAlreadyAddCommentBadRp == true) {
            	console.log(2);
				alert('이미 싫어요를 누르셨습니다.');
				console.log(3);
				return;
			}
            
            <!-- 좋아요가 눌려 있지 않은 경우 좋아요 1 추가 -->
			if (isAlreadyAddCommentGoodRp == false) {
				console.log(4);
				$.ajax({
					url : "/usr/reactionPoint/increaseGoodRp",
					
					type : "POST",
				
					data : { relTypeCode: 'comment', id : commentId },
				
					success : function(goodReactionPoint) {
						console.log(9);
						$("#add-comment-goodRp-btn").addClass("already-added");
						console.log(10);
						$(".add-comment-goodRp").text(goodReactionPoint);
						console.log(11);
						isAlreadyAddCommentGoodRp = true;
						console.log(12);
					},
					error : function() {
						alert('서버 에러, 다시 시도해주세요.');
					}
				});
                
              <!-- 이미 좋아요가 눌려 있는 경우 좋아요 1 감소 -->  
			} else if (isAlreadyAddCommentGoodRp == true){
				console.log(13);
				$.ajax({
					
					url : "/usr/reactionPoint/decreaseGoodRp",
					
					type : "POST",
				
					data : { relTypeCode: 'comment', id : commentId },
					
					success : function(goodReactionPoint) {
						console.log(18);
						$("#add-comment-goodRp-btn").removeClass("already-added");
						console.log(19);
						$(".add-comment-goodRp").html(goodReactionPoint);
						console.log(20);
						isAlreadyAddCommentGoodRp = false;
						console.log(21);
					},
					error : function() {
						alert('서버 에러, 다시 시도해주세요.');
					}
				});
			} else {
				return;
			}
		});
        
        <!-- 싫어요 버튼 클릭 이벤트 및 ajax 실행 -->
		$("#add-badRp-btn").click(function() {
			
            <!-- 이미 좋아요가 눌려 있는 경우 반려 -->
            if (isAlreadyAddCommentGoodRp == true) {
				alert('이미 좋아요를 누르셨습니다.');
				return;
			}
            
            <!-- 싫어요가 눌려 있지 않은 경우 싫어요 1 추가 -->
			if (isAlreadyAddCommentBadRp == false) {
				$.ajax({
					url : "/usr/reactionPoint/increaseBadRp",
					type : "POST",
					data : { relTypeCode: 'comment', id : commentId },
					success : function(badReactionPoint) {
						$("#add-comment-badRp-btn").addClass("already-added");
						$(".add-comment-badRp").html(badReactionPoint);
						isAlreadyAddCommentBadRp = true;
					},
					error : function() {
						alert('서버 에러, 다시 시도해주세요.');
					}
				});
                
              <!-- 이미 싫어요가 눌려 있는 경우 싫어요 1 감소 --> 
			} else if (isAlreadyAddCommentBadRp == true) {
				$.ajax({
					url : "/usr/reactionPoint/decreaseBadRp",
					type : "POST",
					data : { relTypeCode: 'comment', id : commentId },
					success : function(badReactionPoint) {
						$("#add-comment-badRp-btn").removeClass("already-added");
						$(".add-comment-badRp").html(badReactionPoint);
						isAlreadyAddCommentBadRp = false;
					},
					error : function() {
						alert('서버 에러, 다시 시도해주세요.');
					}
				});
			} else {
				return;
			}
		});
		
	});		 
</script>


<script>
$(document).ready(function() {
	$('.edit').on('click', function(){
		$('.review_content').attr('disabled', true);
		$(this).parent().prev().children().attr('disabled', false);
		$(this).attr('hidden', true);
		$(this).next().attr('hidden', true); 
		$(this).next().next().next().attr('hidden', true);
		$(this).parent().append('<button type="button" class="btn btn-default" id="btnUpdate" style="margin:0">등록</button>')
	});
	
		$(document).on('click','#btnUpdate', function() {
			 var groupBuyingId = ${groupBuying.id};
			 var commentId = $(this).parent().prev().prev().prev().children().val(); 
			 var body = $(this).parent().prev().children().val();
			 
					$.ajax({
						url:'/usr/comment/doCommentModify',
				         type: 'post',
					     data: {
					    	 "groupBuyingId":groupBuyingId,
					 		"commentId" : commentId,
							"body" :body
						},
				         success: function(result) {
				        	 location.reload();
				          },
				          error: function() {
				          	alert('리뷰 수정 실패');
				          }
					});	
		})
	
});


</script>


<!-- 눌려 있는 버튼 색상 표현 -->
<style type="text/css">
.already-added {
	background-color: #0D3EA3;
	color: white;
}

.do-update-body {
	display: inline-block;
}
</style>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<table class="table-box-1" border="1">
			<tbody>
				<tr>
					<th>번호</th>
					<td>${groupBuying.id }</td>
				</tr>
				<tr>
					<th>작성날짜</th>
					<td>${groupBuying.regDate }</td>
				</tr>
				<tr>
					<th>수정날짜</th>
					<td>${groupBuying.updateDate }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${groupBuying.extra__writer }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${groupBuying.title }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${groupBuying.body }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>
						<span class="groupBuying-detail__hit-count">${groupBuying.hitCount }</span>
					</td>
				</tr>
			</tbody>
		</table>
		<c:if test="${isLogined }">
			<details class="collapse bg-base-200">
				<summary class="collapse-title text-xl font-medium">Comment(${comments.size() })</summary>
				<div class="comment-container">
					<div style="padding: 20px;" class="comment-write-box">
						<form action="../comment/doCommentWrite">
							<input type="hidden" name="id" value="${groupBuying.id }" />
							<input name="body" type="text" placeholder="Comment here" class="input input-bordered input-lg w-full max-w-xs" />
							<button id="add-comment-btn" type="submit" class="btn btn-outline btn-success">댓글 등록</button>
						</form>
					</div>
				</div>
				<table class="table table-review" style="padding: 3em; height: 500px;">
					<colgroup>
						<col style="width: 0%" />
						<col style="width: 10%" />
						<col style="width: 60%" />
						<col style="width: 20%" />
						<col style="width: 30%" />
					</colgroup>
					<tbody>
						<tr style="text-align: center;">
							<th></th>
							<th>닉네임</th>
							<th>리뷰내용</th>
							<th>작성일</th>
							<th>추천</th>
						</tr>
						<c:forEach items="${comments }" var="comment">
							<tr>
								<td>
									<input type="hidden" id="commentId" value="${comment.id }">
								</td>
								<td>${comment.extra__writer}</td>
								<td>
									<input style="width: 60%" class="review_content" type="text" value="${comment.body}" autofocus disabled>
								</td>
								<td>
									<c:if test="${comment.memberId == loginedMemberId}">
										<input data-id="${comment.id }" style="float: left; width: 30%;" class="btn btn-sm edit" value="수정">
										<a class="btn btn-sm" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;"
											href="../comment/doCommentDelete?groupBuyingId=${groupBuying.id }&commentId=${comment.id}">삭제</a>
									</c:if>
									<br>
									<label>${comment.regDate.substring(0,10)}</label>
								</td>
								<td>
									<span id="add-comment-goodRp-btn" class="btn btn-sm">
										좋아요👍
										<span class="add-comment-goodRp ml-2">${comment.goodReactionPoint}</span>
									</span>
								</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</details>

			<span id="add-groupBuying-goodRp-btn" class="btn btn-outline">
				좋아요👍
				<span class="add-groupBuying-goodRp ml-2">${groupBuying.goodReactionPoint}</span>
			</span>
			<span id="add-groupBuying-badRp-btn" class="ml-5 btn btn-outline">
				싫어요👎
				<span class="add-groupBuying-badRp ml-2">${groupBuying.badReactionPoint}</span>
			</span>
			<span id="add-groupBuying-heart-btn" class="btn btn-outline">
				❤️
				<span class="add-groupBuying-heart ml-2">${groupBuying.goodReactionPoint}</span>
			</span>
		</c:if>
		<c:if test="${!isLogined }">
			<details class="collapse bg-base-200">
				<summary class="collapse-title text-xl font-medium">Comment(${comments.size() })</summary>
				<table class="table table-review" style="padding: 3em; height: 300px;">
					<tbody>
						<tr style="text-align: center;">
							<th width="0%"></th>
							<th width="15%">닉네임</th>
							<th width="50%">리뷰내용</th>
							<th width="15%">작성일</th>
							<th width="10%">추천</th>
						</tr>
						<c:forEach items="${comments }" var="comment">
							<tr>
								<td>
									<input type="hidden" id="commentId" value="${comment.id }">
								</td>
								<td>${comment.extra__writer}</td>
								<td>
									<input class="review_content" type="text" value="${comment.body}" autofocus disabled>
								</td>
								<td>
									<c:if test="${comment.memberId == loginedMemberId}">
									</c:if>
									<br>
									<label>${comment.regDate.substring(0,10)}</label>
								</td>
								<td>
									<span id="request-login-good" class="btn btn-sm">
										좋아요👍
										<span class="add-comment-goodRp ml-2">${comment.goodReactionPoint}</span>
									</span>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</details>
			<span id="request-login-good" class="btn btn-outline">
				좋아요👍
				<span class="add-groupBuying-goodRp ml-2">${groupBuying.goodReactionPoint}</span>
			</span>
			<span id="request-login-bad" class="ml-5 btn btn-outline">
				싫어요👎
				<span class="add-groupBuying-badRp ml-2">${groupBuying.badReactionPoint}</span>
			</span>
			<span id="request-login-good" class="btn btn-outline">
				❤️
				<span class="add-groupBuying-heart ml-2">${groupBuying.goodReactionPoint}</span>
			</span>
		</c:if>
		<div class="btns mt-5">
			<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
			<c:if test="${groupBuying.userCanModify }">
				<a class="btn btn-outline" href="../groupBuying/modify?id=${groupBuying.id }">수정</a>
			</c:if>
			<c:if test="${groupBuying.userCanDelete }">
				<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;"
					href="../groupBuying/doDelete?id=${groupBuying.id }">삭제</a>
			</c:if>
		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>