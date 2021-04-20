<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.1.0/chart.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js"></script> -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/chrt.css" />
<!-- section시작 -->
<section>
	<div class="section-body black-section">
		<div class="board black-board">
			<div>
     			<canvas id="myChart" style="display:inline-block; width:600px; height:600px"></canvas>
   			</div>
   			   			
		</div>
	</div>
</section>
<!-- section끝 -->
  <script>
 
    var chartLabels = [];
    var chartPrice=[];
    var chartDate = [];
   
    $(document).ready(function (){
    	chartLabels = [];
    	chartPrice=[];
    	chartDate = [];
    	
    	$.ajax({
    	
    	url : "<%=request.getContextPath() %>/graph/drawGraph",
		
    	success:function(dat){
    		
    		//json 값 분리하여 저장	
    		$.each(dat, function(key, value){
    			//게시물의 번호와 제목 같이 전달
    			chartLabels.push(value.boardNo + " : " +  value.title);
    			
    			//가격과 날짜는 아래에서 map으로 저장하므로 
    			//분리해서 저장한 값은 미사용
    			chartPrice.push(value.price);
    			chartDate.push(value.regDate);
    			
    			
    			//데이터확인용
    			//console.log("레그 데이트 : " + value.regDate);
    		     //console.log(value);
    			//console.log(value.name);
    			//console.log(value.amount);
    			
    			//console.log(chartLabels);
    			//console.log(chartPrice);	
    			// console.log(chartDate);
    				
    		
    		});
    		
    		
    		//날짜형 변환 펑션
    		function parse(str) {
    		    var y = str.substr(0, 4);
    		    var m = str.substr(4, 2);
    		    var d = str.substr(6, 2);
    		   return new Date(y,m-1,d);
    		}
    	
    		//맵으로 데이터값 x,y로 분리해서 저장
    		var chartData = dat.map(function(d){
    			//console.log(a);
				return{
			        x: parse(d.regDate),
			        y: d.price 
			      }
			});
    		
    		//차트 데이터 설정
    		let data = {
    		  labels: chartLabels,
    		  datasets: [
    		    {
    		    //라벨은 표시 안됨
    		      label: [chartLabels[0]],
    		      data: chartData,
    		      borderColor: 'rgb(255, 99, 132)',
    		      backgroundColor: 'rgb(255, 99, 132)',
    		    }
    		    
    		  ]
    		};

    		//차트 설정
    		let config = {
    				  type: 'scatter',
    				  data: data,
    				  options: {
    					 
						responsive: false,
						interaction: {
    					      mode: 'index',
    					      intersect: false,
    					},
    					//툴팁설정
    					tooltips: {
            				  displayColors:false,
            				  mode: 'index',
            				  callbacks: {
            				        title: function(tooltipItem, object) {
            				          return object.labels[tooltipItem[0].index];
            				         },
            				        label: function(tooltipItem, object) {
            				        	const num = Number(tooltipItem.label);
            				        	const regTime = moment(num).format("YYYY/MM/DD");
            				        	const price = Number(tooltipItem.value).toLocaleString();
            				        return [
            				        		"가격 : " + price + "원",
            				        		"등록일 : " + regTime
            				        	   ];
            				        }
            				  }
            			},
    				    	
            			legend: {
    				          display:false
    				    },
    				    title: {
    				    	  
    				           display: true,
    				           text: '시세',
    				           fontSize : 16
    				    },
    				    scales: {
    				          xAxes: [{
    				        	     				        	
    				            scaleLabel: {
    				              display: true,
    				              labelString: "날짜"
    				            },
    				            ticks: {
      				              callback: function(value, index, values) {
      				                 const m = moment(value).format('M월 DD일');
      				            	 return m;
      				              }
      				            }
    				         	
    				          }],
    				          yAxes: [{
      				            scaleLabel: {
      				              display: true,
      				              labelString: "가격"
      				            },
      				         	ticks: {
      				              callback: function(value, index, values) {
      				                  return value.toLocaleString()+ "원";
      				              }
      				            }
      				          }],
    				    }
    			  	}
    		};
    		//console.log(config);
    		
    		//차트 출력
    		 var myChart = new Chart(
    				    document.getElementById('myChart'),
    				    config
    				
    				    );
    		//차트클릭시 이벤트
    		 document.getElementById('myChart').onclick = function(evt) {
    		      var activePoints = myChart.getElementsAtEvent(evt);
    		      if (activePoints[0]) {
    		        var chartData = activePoints[0]['_chart'].config.data;
    		        var idx = activePoints[0]['_index'];

    		        var label = chartData.labels[idx];
    		        var value = chartData.datasets[0].data[idx];
    		        var boardNo = label.split(" ")[0];
					
    		        var url = "http://google.com/search?q=노트북";
    		        console.log(url);
    		        alert(url);
    		       location.href=url;
    		      }
    		    };
    		
    		
    	},
    	error:function(xhr, status, err){
    		console.log(xhr, status, err);
    	}
    	});
    });
    
 
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
