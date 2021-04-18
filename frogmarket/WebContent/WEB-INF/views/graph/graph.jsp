<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.1.0/chart.min.js"></script> -->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/chrt.css" />
<!-- section시작 -->
<section>
	<div class="section-body black-section">
	
		<div class="board black-board">
		<!-- <div id="chart_div" style="width: 900px; height: 500px;"></div> -->
		<!--  <input type="button" id="btn-order" value="주문" />-->
			<div>
     			<canvas id="myChart" style="display:inline-block; width:500px; height:500px"></canvas>
   			</div>
   			<div>
     			<canvas id="myChart12" style="display:inline-block; width:500px; height:500px"></canvas>
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
    		//console.log(dat);
    		console.log(dat);
    		
    		$.each(dat, function(key, value){
    			chartLabels.push(value.title);
    			chartPrice.push(value.price);
    			chartDate.push(value.regDate);
    			console.log("레그 데이트 : " + value.regDate);
    		     //console.log(value);
    			//console.log(value.name);
    			//console.log(value.amount);
    			
    			console.log(chartLabels);
    			console.log(chartPrice);	
    			 console.log(chartDate);
    				
    		
    		});
    		//날짜형 변환 펑션
    		function parse(str) {
    		    var y = str.substr(0, 4);
    		    var m = str.substr(4, 2);
    		    var d = str.substr(6, 2);
    		    return new Date(y,m-1,d);
    		}

    	
    		console.log(typeof chartDate[0]);
    		console.log(Number(chartDate[0]));
    		console.log(parse(chartDate[0]));
    		
    		
    		const DATA_COUNT = 7;
    		const NUMBER_CFG = {count: DATA_COUNT, rmin: 1, rmax: 1, min: 0, max: 100};

    		    		
    		let labels = [chartLabels[0],chartLabels[1],chartLabels[2],chartLabels[3],chartLabels[4]];
    		//차트 데이터 설정
    		let data = {
    		  labels: labels,
    		  datasets: [
    		    {
    		      label: [chartLabels[0],chartLabels[1],chartLabels[2],chartLabels[3]],
    		      data: [
    		    	  		{
    		    	 		 x:parse(chartDate[0]),
    		    	 	 	y:chartPrice[0]
    		      	  		},
    		      	  		{
        		      		x:parse(chartDate[1]),
        		      		y:chartPrice[1]
        		      		},
        		      		{
            		      	x:parse(chartDate[2]),
            		      	y:chartPrice[2]
            		      	},
            		      	{
                		    x:parse(chartDate[3]),
                		    y:chartPrice[3]
                		    },
            		      	{
                		    x:parse(chartDate[4]),
                		    y:chartPrice[4]
                		    }
        		      		
    		      		],
    		      borderColor: 'rgb(255, 99, 132)',
    		      backgroundColor: 'rgb(255, 99, 132)',
    		    }
    		    
    		  ]
    		};
    			
    		console.log(data.datasets);
    		console.log(data.datasets[0].label);
    		
    		
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
    					tooltips: {
            				  displayColors:false,
            				  mode: 'index',
            				  callbacks: {
            				        title: function(tooltipItem, object) {
            				        //console.log(tooltipItem);
            				       // console.log(object);
            				          return object.labels[tooltipItem[0].index];
            				         },
            				        label: function(tooltipItem, object) {
            				        	const num = Number(tooltipItem.label);
            				        	const regTime = moment(num).format("YYYY/MM/DD");
            				        	console.log(regTime);
            				        return ["가격 : " + tooltipItem.value,
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
    				           text: '시세'
    				    },
    				    scales: {
    				          xAxes: [{
    				        	     				        	
    				            scaleLabel: {
    				              display: true,
    				              labelString: "날짜"
    				            },
    				            ticks: {
      				              callback: function(value, index, values) {
      						         console.log("value : " + value);
      				                 const m = moment(value).format('M월 DD일');
      				                 console.log(m);
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
      				            	//  console.log(value);
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
    		
    		
    	},
    	error:function(xhr, status, err){
    		console.log(xhr, status, err);
    	}
    	});
    });
    
    // 예시용 차트 예제
    new Chart(document.getElementById('myChart1'), {
    	  type: 'line',
    	  data: {
    	      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
    	      datasets: [{
    	          label: 'My First dataset',
    	          borderColor: 'red',
    	          backgroundColor: 'red',
    	          data: [15, 22, 18, 28, 8, 13, 24],
    	          fill: false,
    	      }, {
    	          label: 'My Second dataset',
    	          borderColor: 'blue',
    	          backgroundColor: 'blue',
    	          data: [5, 31, 15, 22, 19, 29, 12],
    	          fill: false,
    	      }]
    	  },
    	  options: {
    	      responsive: true,
    	      title: {
    	          display: true,
    	          text: 'Chart.js Line Chart - Custom Information in Tooltip'
    	      },
    	      tooltips: {
    	          mode: 'index',
    	          callbacks: {
    	              title: (tooltipItem, data) => data.labels[tooltipItem[0].index],
    	              footer: (tooltipItems, data) => {
    	                  var sum = 0;
    	                  tooltipItems.forEach(function(tooltipItem) {
    	                      sum += data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
    	                  });
    	                  return 'Sum: ' + sum;
    	              },
    	          },
    	          footerFontStyle: 'normal'
    	      },
    	      hover: {
    	          mode: 'index',
    	          intersect: true
    	      },
    	      scales: {
    	          xAxes: [{
    	              display: true,
    	              scaleLabel: {
    	                  show: true,
    	                  labelString: 'Month'
    	              }
    	          }],
    	          yAxes: [{
    	              display: true,
    	              scaleLabel: {
    	                  show: true,
    	                  labelString: 'Value'
    	              }
    	          }]
    	      }
    	  }
    	});   
    
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
