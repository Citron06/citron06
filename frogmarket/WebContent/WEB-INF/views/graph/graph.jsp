<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.1.0/chart.js" integrity="sha512-LlFvdZpYhQdASf4aZfSpmyHD6+waYVfJRwfJrBgki7/Uh+TXMLFYcKMRim65+o3lFsfk20vrK9sJDute7BUAUw==" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/graph.css" />
<!-- section시작 -->
<section>
	<div class="section-body black-section">
		<div class="black-banner"></div>
		<div class="board black-board">
		<!-- <div id="chart_div" style="width: 900px; height: 500px;"></div> -->
		<!--  <input type="button" id="btn-order" value="주문" />-->
		<div>
     	 <canvas id="myChart" width="400" height="400"></canvas>
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
    	datatype: "json",
    	url : "<%=request.getContextPath() %>/graph/drawgraph",
		
    	success:function(dat){
    		//console.log(dat);
    		console.log(dat);
    		
    		$.each(dat, function(key, value){
    			chartLabels.push(value.title);
    			chartPrice.push(value.price);
    			chartDate.push(value.regDate);
    		     //console.log(value);
    			//console.log(value.name);
    			//console.log(value.amount);
    			
    			console.log(chartLabels);
    			console.log(chartPrice);	
    			 console.log(chartDate);
    				
    		
    		});
    		
    		console.log(typeof chartDate[0]);
    		console.log(Number(chartDate[0].substring(8, 12)));
    		const DATA_COUNT = 7;
    		const NUMBER_CFG = {count: DATA_COUNT, rmin: 1, rmax: 1, min: 0, max: 100};

    		const labels = chartLabels[0];
    		const data = {
    		  labels: labels,
    		  datasets: [
    		    {
    		      label: chartLabels[0],
    		      data: [{x:Number(chartDate[0].substring(8, 12)), y:chartPrice[0]}],
    		      borderColor: 'rgb(255, 99, 132)',
    		      backgroundColor: 'rgb(255, 99, 132)',
    		    }
    		    
    		  ]
    		};
    			
    		const config = {
    				  type: 'scatter',
    				  data: data,
    				  options: {
    				    responsive: false,
    				    plugins: {
    				      legend: {
    				        position: 'top',
    				      },
    				      title: {
    				        display: true,
    				        text: '시세'
    				      }
    				    }
    				  },
    				};
    		
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
    
    
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
