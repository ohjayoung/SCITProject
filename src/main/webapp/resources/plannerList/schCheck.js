 function schCheck() {
      var title=$("#schTitle").val();// #은 아이디, .은 클래스
      var content=$("#schContent").val();
      var startDate=$("#schStartdate").val();
      var endDate=$("#schEnddate").val();
   
      

   
      
      if (title.trim().length==0){
         alert("제목을 입력해주세요")
         return false;
      }
      
      if(content.trim().length==0){
         alert("내용을 입력해주세요");
         
         return false;
      }
      
      
      var startDate1=startDate.split("-");
      var startDateNum='';
      
      for(var i =0; i<startDate1.length; i++){
         startDateNum += startDate1[i];
      }
      
      var endDate1=endDate.split("-");
      var endDateNum='';
      
      for(var i=0; i<endDate1.length; i++){
         endDateNum+= endDate1[i];
      }
      
      if(parseInt(startDateNum) > parseInt(endDateNum)){   //startDate와 마감일 비교
         alert("마감일은 시작일보다 이전일 수 없습니다. ");
         return false;
      }
    
      if(startDate.trim().length==0){
         alert("시작일을 정해주세요.");
         return false;
      }
      
      if(endDate.trim().length==0){//마감일은 시작일이상으로 설정되게
      alert("마감일을 정해주세요.");
      return false;
      }
      
 
         
   }
   