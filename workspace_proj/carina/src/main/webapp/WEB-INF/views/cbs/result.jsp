<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
<script src="${pageContext.request.contextPath}/resources/js/html2canvas.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jspdf.min.js"></script>
<style>
        /* Add your styles here */
        .selected {
            background-color: #d4edda; /* Change the background color for selected cells if desired */
        }
        strong#information{
        	background-color: #d4edda;
        }
</style>
</head>
<body id="test">
	<%@include file="/WEB-INF/inc/top.jsp"%>

	<script>

	
	
	// 로컬 스토리지에서 값을 가져오는 함수
	function getResultFromLocalStorage() {
	    var result = JSON.parse(localStorage.getItem('calculationResult'));
	    return result;
	}



    
	
    $(document).ready(function() {
    	// 로컬 스토리지에 값을 저장하는 함수
    	function saveToLocalStorage(key, value) {
    	    localStorage.setItem(key, JSON.stringify(value));
    	}

    	
    	// 계산 결과를 로컬 스토리지에 저장
    	function saveResultToLocalStorage() {
    		
    		
    		
    		
    	    // 다른 필요한 값들도 추가
    	    var result = {
    	        	//사용자솔루션선택 총요금 총탄소감소량
    	        	 globalTotalCost : globalTotalCost,
    	        	 globalTotalCo2 : globalTotalCo2,
    	        	
    	        	//사용자이름전역변수로
    	        	 nameInput : nameInput,
    	             // 주거형태 선택값 가져오기
    	             housingType : housingType,

    	             // 거주면적 선택값 가져오기
    	             residenceArea : residenceArea,

    	             // 거주인원 선택값 가져오기
    	             people : people,
    	        	
    	        	//솔루션선택했을때 솔루션값뺀 전기,가스,수도별 총합
    	    		 totalReduce : totalReduce,
    	    		 wReduce : wReduce,
    	    		 eReduce : eReduce,
    	    		 gReduce : gReduce,

    	        	
    	        	//다른가구평균 값들
    	        	 totalAmount : totalAmount,//아작스로 값가져옴
    	             totalTree : totalTree,//아작스로 값 가져옴
    	         	 electricity : electricity,//아작스 값가져옴
    	         	 water : water,//아작스 값가져옴
    	         	 gas : gas,//아작스 값가져옴


    				//사용자계산값
    	             electricityEmission : electricityEmission,
    	             gasEmission : gasEmission,
    	             waterEmission : waterEmission,
    	             totalTreeConversion : totalTreeConversion,
    	    		 totalCarbonEmission : totalCarbonEmission,
    	    	    //선택지에  따른 전기 , 가스 , 수도별 탄소배출량 과 요금합계 
    	    	    	
    	    	   	 totalCo2g : totalCo2g,
    	    	   	 totalCostg : totalCostg,
    	    	    	
    	    	     totalCo2w : totalCo2w,
    	    	     totalCostw: totalCostw,
    	    	    	
    	    	     totalCo2e : totalCo2e,
    	    	     totalCoste: totalCoste,
    	    	     
    	    	     
    	    		 selectedCellContentse : selectedCellContentse, //전기탭의 솔루션 내용 배열저장
    	    		 selectedCellContentsg : selectedCellContentsg, //가스탭의 솔루션 내용 배열저장
    	    		 selectedCellContentsw : selectedCellContentsw, //수도탭의 솔루션 내용 배열저장
    	        
    	    };


    	    saveToLocalStorage('sendReport', result);
    	}
    	//선택지에  따른 전기 , 가스 , 수도별 탄소배출량 과 요금합계 
    	
    	var totalCo2g;
    	var totalCostg;
    	
    	var totalCo2w;
    	var totalCostw;
    	
    	var totalCo2e;
    	var totalCoste;
    	
    	
    	
    	//사용자솔루션선택 총요금 총탄소감소량
    	var globalTotalCost;
    	var globalTotalCo2;
    	
    	//사용자이름전역변수로
    	var nameInput;
        
        // 주거형태 선택값 가져오기
        var housingType; 

        // 거주면적 선택값 가져오기
        var residenceArea;

        // 거주인원 선택값 가져오기
        var people;
    	
    	//솔루션선택했을때 솔루션값뺀 전기,가스,수도별 총합
		var totalReduce = 0;
		var wReduce = 0;
		var eReduce = 0;
		var gReduce = 0;

    	
    	//다른가구평균 값들
    	var totalAmount = 0;//아작스로 값가져옴
        var totalTree = 0;//아작스로 값 가져옴
     	var electricity = 0;//아작스 값가져옴
     	var water = 0;//아작스 값가져옴
     	var gas = 0;//아작스 값가져옴


        // 사용자가 입력한값들
        var storedResult = getResultFromLocalStorage();
        var electricityEmission = storedResult.electricityEmission;
        var gasEmission = storedResult.gasEmission;
        var waterEmission = storedResult.waterEmission;
        var totalTreeConversion = storedResult.totalTreeConversion
		var totalCarbonEmission = storedResult.totalCarbonEmission

        // 가져온 값이 있다면 콘솔에 출력
        if (storedResult) {
            console.log('전기 Emission:', storedResult.electricityEmission);
            console.log('수도 Conversion:', storedResult.waterEmission);
            console.log('가스 Conversion:', storedResult.gasEmission);
            console.log(storedResult.totalTreeConversion)
            console.log(storedResult.totalCarbonEmission)
            // 다른 필요한 값들도 출력
        } else {
            console.log('No stored result found.');
        }
        
        console.log('Local Storage Contents:', localStorage)
    	
    	
        // 저장 버튼 클릭 시 이벤트 처리
        $('#saveButton').on('click', function() {
            // 이름(별명) 입력값 가져오기
            nameInput = $('#exampleInputEmail67').val();
            

            // 주거형태 선택값 가져오기
            housingType = $('input[name="housingType"]:checked').val();

            // 거주면적 선택값 가져오기
            residenceArea = $('input[name="residenceArea"]:checked').val();

            // 거주인원 선택값 가져오기
            people = $('input[name="people"]:checked').val();

            // 개인정보 동의 여부 확인
            var isAgreed = $('#defaultCheck222').prop('checked');
            
            if(isAgreed){

            // 콘솔에 출력
            console.log("이름(별명): " + nameInput);
            console.log("주거형태: " + housingType);
            console.log("거주면적: " + residenceArea);
            console.log("거주인원: " + people);
            console.log("개인정보 수집 및 이용에 동의함: " + isAgreed);
            
            $.ajax({
                type: "POST",
                url: '<c:url value="/getTotal" />',  // 실제 URL은 프로젝트에 맞게 변경해야 합니다.
                contentType: "application/json",
                data: JSON.stringify({
                    house: housingType,
                    area: residenceArea,
                    personnel: people
                }),
                success: function (data) {
                    // 서버 응답에 따른 동작 수행
                    console.log(data);
                    
                    //배열의 첫번째값 가져오기
                    var Object = data[0];
                    
                    
                     totalAmount = Object.totalAmount;
                     totalTree = Object.totalTree;
                     water = Object.water;
                     electricity = Object.electricity;
                     gas = Object.gas;
                    
                    //결과를 화면에 출력
                    var resultContainer = $("#resultContainer")
                    resultContainer.html(""); // 결과를 초기화


                    // 결과에 대한 추가 정보를 화면에 추가
                    var additionalInfo; 
                    
                    if(storedResult.totalCarbonEmission >  totalAmount){
                    	 var moreEmission = Math.round((storedResult.totalCarbonEmission - totalAmount) * 10) / 10; // 반올림
                    additionalInfo ="<strong id='information'>" + nameInput + "</strong> 님 가정의  이산화탄소 배출량은 총 " + "<strong id='information'>" +storedResult.totalCarbonEmission +"kg</strong>  이며, 비슷한 다른 가정 평균 "
                                   +"<strong  id='information'>"+ totalAmount +"kg</strong> 보다   <strong  id='information'>"+  moreEmission +"kg </strong> 더 많이 배출하고 있습니다. <strong  id='information'>" + storedResult.totalCarbonEmission +
                                    " kg</strong>의 이산화탄소를 상쇄시키기 위해서는 <strong  id='information'>" + storedResult.totalTreeConversion + "</strong> 그루의 소나무를 심어야 합니다.";
                }else{
                	 var lessEmission = Math.round((totalAmount -storedResult.totalCarbonEmission) * 10) / 10; // 반올림
                    additionalInfo = "<strong id='information'>" + nameInput +  "</strong> 님 가정의 이산화탄소 배출량은 총  <strong  id='information'>" + storedResult.totalCarbonEmission + "kg</strong> 이며,비슷한 다른 가정 평균 <strong  id='information'>" 
                   	 + totalAmount + "kg</strong> 보다  <strong  id='information'>" + lessEmission  +"kg</strong> 더  적게 배출하고 있습니다. <strong  id='information'>" + storedResult.totalCarbonEmission +
                    "kg</strong>의 이산화탄소를 상쇄시키기 위해서는  <strong  id='information'>" + storedResult.totalTreeConversion + "</strong> 그루의 소나무를 심어야 합니다.";
                }
                    
                    
                    // 결과에 대한 추가 정보를 해당 ID를 가진 요소에 업데이트
                    $("#carbonEmissionInfo").html(additionalInfo);
                    
                    // 첫 줄에도 이름 동적 업데이트
                    $('span.card-text.small').html(nameInput + '님의 이산화탄소 발생량 통계입니다.');
                    
                    
                    // 그래프를 그리기 위한 데이터
                    var totalData = {
                        labels: ['사용자탄소발생', '다른집탄소발생', '사용자나무환산', '다른집나무환산'],
                        datasets: [{
                            data: [totalCarbonEmission, totalAmount, totalTreeConversion, totalTree],
                            backgroundColor: ['rgba(255, 99, 132, 0.8)', 'rgba(54, 162, 235, 0.8)', 'rgba(255, 206, 86, 0.8)', 'rgba(75, 192, 192, 0.8)'],
                            borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)'],
                            borderWidth: 1
                        }]
                    };

                    // 캔버스 요소 가져오기
                    var totalChartCtx = document.getElementById('totalChart').getContext('2d');

            
                    var totalChart = new Chart(totalChartCtx, {
                        type: 'bar',
                        data: totalData,
                        options: {
                            responsive: false,
                            plugins: {
                                legend: {
                                    display: false
                                },
                                tooltips:{
                                	enabled: true
                                },
                                datalabels: {
                                	display : true,
                                    anchor: 'end',
                                    align: 'end',
                                    formatter: function(value, ctx){
                                        return value.toFixed(2);
                                    }
                                }
                            }
                        }
                    });
                    // 그래프를 그리기 위한 데이터
                    var electricityData = {
                        labels: ['우리집', '다른집'],
                        datasets: [{
                            data: [electricityEmission, electricity],
                            backgroundColor: ['rgba(255, 99, 132, 0.8)', 'rgba(54, 162, 235, 0.8)'],
                            borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)'],
                            borderWidth: 1
                        }]
                    };

                    // 캔버스 요소 가져오기
                    var electricityChartCtx = document.getElementById('electricityChart').getContext('2d');

                    // Chart.js를 이용하여 그래프 그리기
                    var electricityChart = new Chart(electricityChartCtx, {
                        type: 'bar',
                        data: electricityData,
                        options: {
                            responsive: false,
                            plugins: {
                                legend: {
                                    display: false
                                },
                                datalabels: {
                                	display : true,
                                    anchor: 'end',
                                    align: 'end',
                                    formatter: function(value, ctx){
                                        return value.toFixed(2);
                                    }
                                }
                            }
                        }
                    });    
                    
                    // 그래프를 그리기 위한 데이터
                    var gasData = {
                        labels: ['우리집', '다른집'],
                        datasets: [{
                            data: [gasEmission, gas],
                            backgroundColor: ['rgba(255, 99, 132, 0.8)', 'rgba(54, 162, 235, 0.8)'],
                            borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)'],
                            borderWidth: 1
                        }]
                    };

                    // 캔버스 요소 가져오기
                    var gasChartCtx = document.getElementById('gasChart').getContext('2d');

                    // Chart.js를 이용하여 그래프 그리기
                    
                    var gasChart = new Chart(gasChartCtx, {
                        type: 'bar',
                        data: gasData,
                        options: {
                            responsive: false,
                            plugins: {
                                legend: {
                                    display: false
                                },
                                datalabels: {
                                	display : true,
                                    anchor: 'end',
                                    align: 'end',
                                    formatter: function(value, ctx){
                                        return value.toFixed(2);
                                    }
                                }
                            }
                        }
                    });    
                    
                    // 그래프를 그리기 위한 데이터
                    var waterData = {
                        labels: ['우리집', '다른집'],
                        datasets: [{
                            data: [waterEmission, water],
                            backgroundColor: ['rgba(255, 99, 132, 0.8)', 'rgba(54, 162, 235, 0.8)'],
                            borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)'],
                            borderWidth: 1
                        }]
                    };

                    // 캔버스 요소 가져오기
                    var waterChartCtx = document.getElementById('waterChart').getContext('2d');

                    // Chart.js를 이용하여 그래프 그리기
                    var waterChart = new Chart(waterChartCtx, {
                        type: 'bar',
                        data: waterData,
                        options: {
                            responsive: false,
                            plugins: {
                                legend: {
                                    display: false
                                },
                                datalabels: {
                                	display : true,
                                    anchor: 'end',
                                    align: 'end',
                                    formatter: function(value, ctx){
                                        return value.toFixed(2);
                                    }
                                }
                            }
                        }
                    });    
                    
                },
                error: function (error) {
                    console.error(error);
                }
            });

   
            $('#tabs-icons-text-2-tab').tab('show');
           
            }else{
            	alert("개인정보 수집 및 이용에 동의해야 합니다.")
            }
            
            
     		
       });
        
        // Chart.js를 이용하여 원 그래프를 그리는 코드
        var ctxDoughnut = document.getElementById('myDoughnutChart').getContext('2d');
        var myDoughnutChart = new Chart(ctxDoughnut, {
            type: 'doughnut',
            data: {
                labels: ['전기', '가스', '수도'], // 그래프의 라벨
                datasets: [{
                    data: [electricityEmission, gasEmission, waterEmission], // 그래프에 표시될 데이터
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.8)',
                        'rgba(54, 162, 235, 0.8)',
                        'rgba(255, 206, 86, 0.8)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                cutout: '70%', // 중앙에 구멍을 내기 위한 옵션
                responsive: false,
                plugins: {
                    legend: {
                        position: 'bottom' // 범례 위치
                        
                    }
                }
            }
        }); 
        
        
        
        var selectedDatae = []; // 전기 데이터 저장 배열
        var selectedDatag = []; // 가스 데이터 저장배열
        var selectedDataw = []; // 수도 데이터 저장배열
        
		var selectedCellContentse = []; //전기탭의 솔루션 내용 배열저장
		var selectedCellContentsg = []; //가스탭의 솔루션 내용 배열저장
		var selectedCellContentsw = []; //수도탭의 솔루션 내용 배열저장
        
        




        // 테이블의 각 셀에 이벤트 리스너 추가
        $('#electricityTable').on('click', '.clickable-cell', function () {
            var cellContent = $(this).text(); // 셀의 내용을 가져옵니다
        	 //alert($(this).attr("data-a"));
        	 //alert($(this).attr("data-b"));
            // 선택한 셀에 'selected' 클래스 토글
    
            $(this).toggleClass('selected');
            console.log( $(this).hasClass('selected'));
            
            var co2Value = parseFloat($(this).data('co2')) || 0;
            var costValue = parseFloat($(this).data('cost')) || 0;
            

            // 선택된 셀에 대한 추가 동작 수행
            if ($(this).hasClass('selected')) {
                
                //선택된 값 배열에 추가
                selectedDatae.push({ co2: co2Value, cost: costValue});
                //선택된 셀내용 추가
				selectedCellContentse.push(cellContent);                
            } else {
            	//해제된 경우:배열에서 해당값제거
                selectedDatae = selectedDatae.filter(function (data){
                	return data.co2 !== co2Value && data.cost !== costValue; 	

                });
                selectedCellContentse = selectedCellContentse.filter(function (content){
                	return content !== cellContent
                });            

            }
            
            updateTotale();
            updateGlobalTotal();
            drawElectricityBarChart(electricity, electricityEmission, electricityEmission - getTotal(selectedDatae));
            console.log(selectedDatae);
            console.log("1");
            eReduce =electricityEmission - getTotal(selectedDatae)
            console.log(selectedCellContentse);

        });





        

        
        // 가스 탭에서 셀을 선택할 때 호출되는 함수
        $('#gasTable').on('click', '.clickable-cell', function () {
        	 var cellContent = $(this).text();
            $(this).toggleClass('selected');
            var co2Value = parseFloat($(this).data('co2')) || 0;
            var costValue = parseFloat($(this).data('cost')) || 0;

            if ($(this).hasClass('selected')) {
                selectedDatag.push({ co2: co2Value, cost: costValue });
				selectedCellContentsg.push(cellContent);     
            } else {
                selectedDatag = selectedDatag.filter(function (data) {
                    return data.co2 !== co2Value && data.cost !== costValue;
                });
                selectedCellContentsg = selectedCellContentsg.filter(function (content){
                	return content !== cellContent
                });            

            }

            updateTotalg();
            updateGlobalTotal();
            drawGasBarChart(gas, gasEmission, gasEmission - getTotal(selectedDatag));
            console.log(selectedDatag);
            console.log("1");
            gReduce = gasEmission - getTotal(selectedDatag)
        });
        
        // 테이블의 각 셀에 이벤트 리스너 추가
        $('#waterTable').on('click', '.clickable-cell', function () {
        	var cellContent = $(this).text();
            // 선택한 셀에 'selected' 클래스 토글
            $(this).toggleClass('selected');
            var co2Value = parseFloat($(this).data('co2')) || 0;
            var costValue = parseFloat($(this).data('cost')) || 0;
            
            // 선택된 셀에 대한 추가 동작 수행
            if ($(this).hasClass('selected')) {
                selectedDataw.push({ co2: co2Value, cost: costValue});
				selectedCellContentsw.push(cellContent)
                
            } else {
            	//해제된 경우:배열에서 해당값제거
                selectedDataw = selectedDataw.filter(function (data){
                	return data.co2 !== co2Value && data.cost !== costValue;
                });
                selectedCellContentsw = selectedCellContentsw.filter(function (content){
                	return content !== cellContent
                });       
            

            }
            updateTotalw();
            updateGlobalTotal();
            drawWaterBarChart(water, waterEmission, waterEmission - getTotal(selectedDataw));
            console.log(selectedDataw);
            console.log("1");
            wReduce = waterEmission - getTotal(selectedDataw)
        });
        
        
        function updateTotale(){
        	 totalCo2e = 0;
        	 totalCoste = 0;
        	
        	//모든 선택된 값 순회
            selectedDatae.forEach(function (data) {
                totalCo2e += data.co2;
                totalCoste += data.cost;
            });
           //합계 값을 요약 카드에 업데이트
           $('#co2Electricity').text(totalCo2e.toFixed(1) + 'kg');
           $('#costElectricity').text(totalCoste.toFixed(0) + '원');
        }
        
        function updateTotalg(){
        	 totalCo2g = 0;
        	 totalCostg = 0;
        	
        	//모든 선택된 값 순회
            selectedDatag.forEach(function (data) {
                totalCo2g += data.co2;
                totalCostg += data.cost;
            });
           //합계 값을 요약 카드에 업데이트
           $('#co2Gas').text(totalCo2g.toFixed(1) + 'kg');
           $('#costGas').text(totalCostg.toFixed(0) + '원');
        }
        
        
        function updateTotalw(){
        	 totalCo2w = 0;
        	 totalCostw = 0;
        	
        	//모든 선택된 값 순회
            selectedDataw.forEach(function (data) {
                totalCo2w += data.co2;
                totalCostw += data.cost;
            });
           //합계 값을 요약 카드에 업데이트
           $('#co2Water').text(totalCo2w.toFixed(1) + 'kg');
           $('#costWater').text(totalCostw.toFixed(0) + '원');
        }
        
        
        // 전체 합계 업데이트 함수
        function updateGlobalTotal() {
        	  globalTotalCo2 = getTotal(selectedDatae) + getTotal(selectedDatag) + getTotal(selectedDataw);
              globalTotalCost = getTotalCost(selectedDatae) + getTotalCost(selectedDatag) + getTotalCost(selectedDataw);
			 

			

            // 전체 합계 값을 요약 카드에 업데이트
            $('#totalCo2').text(globalTotalCo2.toFixed(1) + 'kg');
            $('#totalCost').text(globalTotalCost.toFixed(0) + '원');
            console.log("totalCo2:", globalTotalCo2, "totalCost:", globalTotalCost);
        }
        
     // 선택된 데이터 배열에서 co2 합을 반환하는 함수
        function getTotal(dataArray) {
            var total = 0;
            dataArray.forEach(function (data) {
                total += data.co2;
            });
            return total;
        }

        // 선택된 데이터 배열에서 cost 합을 반환하는 함수
        function getTotalCost(dataArray) {
            var total = 0;
            dataArray.forEach(function (data) {
                total += data.cost;
            });
            return total;
        }
        
        
        var myUseBarChart; // 전역 변수로 선언

        function drawGasBarChart(totalGas, selectedGas, reducedGas) {
            var gasBarChartCanvas = document.getElementById('useBarChart').getContext('2d');
            var gasBarChartData = {
                labels: ['다른집', '우리집', '목표'],
                datasets: [{
                    data: [totalGas, selectedGas,  Math.max(0, reducedGas)],
                    backgroundColor: ['rgba(255, 99, 132, 0.8)', 'rgba(54, 162, 235, 0.8)', 'rgba(255, 206, 86, 0.8)'],
                    borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)'],
                    borderWidth: 1
                }]
            };

            // 만약 이전에 그려진 그래프가 있다면 파괴
            if (myUseBarChart) {
                myUseBarChart.destroy();
            }

            // 가스 막대 그래프 생성
            myUseBarChart = new Chart(gasBarChartCanvas, {
                type: 'bar',
                data: gasBarChartData,
                options: {
                    responsive: false,
                    plugins: {
                        legend: {
                            display: false
                        }
                    }
                }
            });
        }



        function drawWaterBarChart(totalWater, selectedWater, reducedWater) {
            var waterBarChartCanvas = document.getElementById('useBarChart').getContext('2d');
            var waterBarChartData = {
                labels: ['다른집', '우리집', '목표'],
                datasets: [{
                    data: [totalWater, selectedWater,  Math.max(0, reducedWater)],
                    backgroundColor: ['rgba(255, 99, 132, 0.8)', 'rgba(54, 162, 235, 0.8)', 'rgba(255, 206, 86, 0.8)'],
                    borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)'],
                    borderWidth: 1
                }]
            };

            // 만약 이전에 그려진 그래프가 있다면 파괴
            if (myUseBarChart) {
                myUseBarChart.destroy();
            }

            // 수도 막대 그래프 생성
            myUseBarChart = new Chart(waterBarChartCanvas, {
                type: 'bar',
                data: waterBarChartData,
                options: {
                    responsive: false,
                    plugins: {
                        legend: {
                            display: false
                        }
                    }
                }
            });
        }
        
        function drawElectricityBarChart(totalElectricity, selectedElectricity, reducedElectricity) {
            var electricityBarChartCanvas = document.getElementById('useBarChart').getContext('2d');
            var electricityBarChartData = {
                labels: ['다른집', '우리집', '목표'],
                datasets: [{
                    data: [totalElectricity, selectedElectricity,  Math.max(0, reducedElectricity)],
                    backgroundColor: ['rgba(255, 99, 132, 0.8)', 'rgba(54, 162, 235, 0.8)', 'rgba(255, 206, 86, 0.8)'],
                    borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)'],
                    borderWidth: 1
                }]
            };

            // 만약 이전에 그려진 그래프가 있다면 파괴
            if (myUseBarChart) {
                myUseBarChart.destroy();
            }

            // 전기 막대 그래프 생성
            myUseBarChart = new Chart(electricityBarChartCanvas, {
                type: 'bar',
                data: electricityBarChartData,
                options: {
                    responsive: false,
                    plugins: {
                        legend: {
                            display: false
                        }
                    }
                }
            });
        }
        
     // 전기 탭 클릭 시
        $('#tabs-text-1-tab').on('click', function () {
            // 전기 탭에 맞게 그래프 그리기
        	drawElectricityBarChart(electricity, electricityEmission, electricityEmission - getTotal(selectedDatae));
        });

        // 가스 탭 클릭 시
        $('#tabs-text-2-tab').on('click', function () {
            // 가스 탭에 맞게 그래프 그리기
        	drawGasBarChart(gas, gasEmission, gasEmission - getTotal(selectedDatag));
        });

        // 수도 탭 클릭 시
        $('#tabs-text-3-tab').on('click', function () {
            // 수도 탭에 맞게 그래프 그리기
        	drawWaterBarChart(water, waterEmission, waterEmission - getTotal(selectedDataw));
        });
        

        
        
        var co2UseBarChart; // 전역 변수로 선언
  		
        function drawCo2BarChart(totalAmount, totalCarbonEmission, reduceCo2 )  {
            var co2BarChartCanvas = document.getElementById('co2comparison').getContext('2d');
            var co2BarChartData = {
                labels: ['다른집', '우리집', '목표'],
                datasets: [{
                    data: [totalAmount, totalCarbonEmission,reduceCo2],
                    backgroundColor: ['rgba(255, 99, 132, 0.8)', 'rgba(54, 162, 235, 0.8)', 'rgba(255, 206, 86, 0.8)'],
                    borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)'],
                    borderWidth: 1
                }]
            };

            // 만약 이전에 그려진 그래프가 있다면 파괴
            if (co2UseBarChart) {
            	co2UseBarChart.destroy();
            }

 
            co2UseBarChart = new Chart(co2BarChartCanvas, {
                type: 'bar',
                data: co2BarChartData,
                options: {
                    responsive: false,
                    plugins: {
                        legend: {
                            display: false
                        }
                    }
                }
            });
        }
			
       // var reduceCo2 = totalCarbonEmission -getTotal(selectedDataw) - getTotal(selectedDatae) - getTotal(selectedDatag);
    
        function updateCO2Comparison() {
			var comparisonText ;
			var userName;
			var userInfo
        	drawCo2BarChart(totalAmount, totalCarbonEmission,(totalCarbonEmission - globalTotalCo2) )
            var totalCO2 = totalCarbonEmission;
            var treesToPlant = totalTreeConversion ;
            var Difference = (totalAmount - totalCarbonEmission);
            var sectorsWithMoreCO2 = 0;
            console.log(totalCO2);
            console.log(`- 이산화탄소 배출량은 총 `+totalCO2+`kg 이며`);
            console.log(Difference)
            var count = 0;
            
            if(electricityEmission > electricity){
            	count +=1;
            }
 			if(waterEmission > water){
            	count +=1;
            }
 			if(gasEmission > gas){
            	count +=1;
            }
            
            
            
            if (Difference < 0){
            // HTML 업데이트
             comparisonText = `- 이산화탄소 배출량은 총 `+totalCO2+`kg 이며, 비슷한 규모의 다른 가정보다 약 `+Math.abs(Difference)+`kg 더 많이 배출하고 있습니다.<br><br>` +
                `- 이만큼의 이산화탄소를 없애기 위해서는 약 `+treesToPlant+` 그루의 소나무를 심어야 합니다.<br><br>` +
                `- 부문별로 보면 전기,가스,수도  3개 부문 중`+count+`개 부문에서 다른 가정보다 이산화탄소 배출이 많습니다.`;
            }else{
            	comparisonText = `- 이산화탄소 배출량은 총 `+totalCO2+`kg 이며, 비슷한 규모의 다른 가정보다 약 `+Math.abs(Difference)+`kg 더 적게 배출하고 있습니다.<br><br>` +
                `- 이만큼의 이산화탄소를 없애기 위해서는 약 `+treesToPlant+` 그루의 소나무를 심어야 합니다.<br><br>` +
                `- 부문별로 보면 전기,가스,수도 3개 부문 중`+count+`개 부문에서 다른 가정보다 이산화탄소 배출이 많습니다.`;
            }
            userName = `-`+ nameInput+`님 가정의 종합평가`
            userInfo = `-`+nameInput+`님 가정에서 이산화탄소 배출을 줄이는 실천을 하시면 약 `+Math.round(globalTotalCo2*10)/10+`kg의 이산화탄소를 줄이고 <br>` +
            			`- `+globalTotalCost+`원의 비용절감 효과과 예상됩니다.`;
            
            document.getElementById('userName').innerHTML = userName;
            document.getElementById('co2ComparisonText').innerHTML = comparisonText;
			document.getElementById('userInfo').innerHTML = userInfo;
            console.log("1");

            
 
            // 버튼 보이도록 설정
            $("#downloadButton").show();
            


        }
        
        var co2EcomparisonBarChart; // 전역 변수로 선언
  		
        function co2EcomparisonChart(electricity, electricityCarbonEmission,eReduceCO2 )  {
            var co2EcomparisonCanvas = document.getElementById('eCO2BarChart').getContext('2d');
            var co2EcomparisonData = {
                labels: ['다른집', '우리집', '목표'],
                datasets: [{
                    data: [electricity, electricityEmission,eReduceCO2],
                    backgroundColor: ['rgba(255, 99, 132, 0.8)', 'rgba(54, 162, 235, 0.8)', 'rgba(255, 206, 86, 0.8)'],
                    borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)'],
                    borderWidth: 1
                }]
            };

            // 만약 이전에 그려진 그래프가 있다면 파괴
            if (co2EcomparisonBarChart) {
            	co2EcomparisonBarChart.destroy();
            }

 
            co2EcomparisonBarChart = new Chart(co2EcomparisonCanvas, {
                type: 'bar',
                data: co2EcomparisonData,
                options: {
                    responsive: false,
                    plugins: {
                        legend: {
                            display: false
                        }
                    }
                }
            });
   
        }
        
        var co2GcomparisonBarChart; // 전역 변수로 선언
  		
        function co2GcomparisonChart(gas, gasCarbonEmission,gReduceCO2 )  {
            var co2GcomparisonCanvas = document.getElementById('gCO2BarChart').getContext('2d');
            var co2GcomparisonData = {
                labels: ['다른집', '우리집', '목표'],
                datasets: [{
                    data: [gas, gasEmission,gReduceCO2],
                    backgroundColor: ['rgba(255, 99, 132, 0.8)', 'rgba(54, 162, 235, 0.8)', 'rgba(255, 206, 86, 0.8)'],
                    borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)'],
                    borderWidth: 1
                }]
            };

            // 만약 이전에 그려진 그래프가 있다면 파괴
            if (co2GcomparisonBarChart) {
            	co2GcomparisonBarChart.destroy();
            }

 
            co2GcomparisonBarChart = new Chart(co2GcomparisonCanvas, {
                type: 'bar',
                data: co2GcomparisonData,
                options: {
                    responsive: false,
                    plugins: {
                        legend: {
                            display: false
                        }
                    }
                }
            });
        }
			
        
        
        var co2WcomparisonBarChart; // 전역 변수로 선언
  		
        function co2WcomparisonChart(water, waterCarbonEmission,wReduceCO2 )  {
            var co2WcomparisonCanvas = document.getElementById('wCO2BarChart').getContext('2d');
            var co2WcomparisonData = {
                labels: ['다른집', '우리집', '목표'],
                datasets: [{
                    data: [water, waterEmission,Math.max(0, wReduceCO2)],
                    backgroundColor: ['rgba(255, 99, 132, 0.8)', 'rgba(54, 162, 235, 0.8)', 'rgba(255, 206, 86, 0.8)'],
                    borderColor: ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)'],
                    borderWidth: 1
                }]
            };

            // 만약 이전에 그려진 그래프가 있다면 파괴
            if (co2WcomparisonBarChart) {
            	co2WcomparisonBarChart.destroy();
            }

 
            co2WcomparisonBarChart = new Chart(co2WcomparisonCanvas, {
                type: 'bar',
                data: co2WcomparisonData,
                options: {
                    responsive: false,
                    plugins: {
                        legend: {
                            display: false
                        }
                    }
                }
            });
        }
			
			
        
        
        
        
        
        
        
        
        
       
        $('#tabs-icons-text-4-tab').on('click', function () {
            // 종합평가를 눌렀을 때 실행되어야 하는 함수 호출
           updateCO2Comparison();
            
           co2GcomparisonChart(gas, gasEmission, gReduce );
           co2WcomparisonChart(water, waterEmission, wReduce ) ;
           co2EcomparisonChart(electricity, electricityEmission, eReduce) ;
        });
        
    	$('#savePdf').click(function() { // pdf저장 button id
    		
    	    html2canvas($('#pdfDiv')[0]).then(function(canvas) { //저장 영역 div id
    		
    	    // 캔버스를 이미지로 변환
    	    var imgData = canvas.toDataURL('image/png');
    		     
    	    var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
    	    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
    	    var imgHeight = canvas.height * imgWidth / canvas.width;
    	    var heightLeft = imgHeight;
    	    var margin = 10; // 출력 페이지 여백설정
    	    var doc = new jsPDF('p', 'mm');
    	    var position = 0;
    	       
    	    // 첫 페이지 출력
    	    doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
    	    heightLeft -= pageHeight;
    	         
    	    // 한 페이지 이상일 경우 루프 돌면서 출력
    	    while (heightLeft >= 20) {
    	        position = heightLeft - imgHeight;
    	        doc.addPage();
    	        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
    	        heightLeft -= pageHeight;
    	    }
    	 
    	    // 파일 저장
    	    doc.save('file-name.pdf');

    		  
    	});

    	});
    	
    	document.getElementById('sendReport').addEventListener('click', function() {
    		saveResultToLocalStorage();
    	    // 다른 페이지의 URL을 여기에 입력하세요
    	    var newPageURL = "${pageContext.request.contextPath}/report";

    	    // 현재 창에서 새로운 페이지로 이동
    	    window.location.href = newPageURL;
    	});
        
        
        
        
    });
    
	</script>
	<div class="row">
		<div class="col-md-4">
			<div class="mt-5 mb-5">
				<span class="font-weight-bold">Tab With Icons</span>
			</div>
		</div>
	</div>
	
	<!-- End of Title -->
	<div class="container" id="pdfDiv">
		<div class="row">
			<div class="col-md-10 col-lg-8">
				<!-- Tab Nav -->
				<div class="nav-wrapper position-relative mb-4">
				    <ul class="nav nav-pills nav-fill flex-column flex-md-row" id="tabs-icons-text" role="tablist">
				        <!-- Tab Item: 나의 정보 -->
				        <li class="nav-item">
				            <a class="nav-link mb-sm-3 mb-md-0 active" id="tabs-icons-text-1-tab" data-toggle="tab"
				               href="#tabs-icons-text-1" role="tab" aria-controls="tabs-icons-text-1" aria-selected="true">
				                <i class="fas fa-tint"></i>나의 정보
				            </a>
				        </li>
				
				        <!-- Tab Item: 사용량분석 -->
				        <li class="nav-item">
				            <a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-2-tab" data-toggle="tab"
				               href="#tabs-icons-text-2" role="tab" aria-controls="tabs-icons-text-2" aria-selected="false">
				                <i class="fas fa-bug"></i>사용량분석
				            </a>
				        </li>
				
				        <!-- Tab Item: 실천목표 -->
				        <li class="nav-item">
				            <a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-3-tab" data-toggle="tab"
				               href="#tabs-icons-text-3" role="tab" aria-controls="tabs-icons-text-3" aria-selected="false">
				                <i class="fas fa-user-astronaut"></i>실천목표
				            </a>
				        </li>
				
				        <!-- Tab Item: 종합평가 -->
				        <li class="nav-item">
				            <a class="nav-link mb-sm-3 mb-md-0" id="tabs-icons-text-4-tab" data-toggle="tab"
				               href="#tabs-icons-text-4" role="tab" aria-controls="tabs-icons-text-4" aria-selected="false">
				                <i class="fas fa-user-astronaut"></i>종합평가
				            </a>
				        </li>
				    </ul>
				</div>				
				<!-- End of Tab Nav -->
				<!-- Tab Content -->
			
				<div class="card1 shadow-inset bg-primary border-light p-4 rounded">
					<div class="card-body p-0">
						<div class="tab-content" id="tabcontent2">
							<div class="tab-pane fade show active" id="tabs-icons-text-1"
								role="tabpanel" aria-labelledby="tabs-icons-text-1-tab">

								<p class="inline-form">
									이름(별명)<input type="text" class="form-control1"
										id="exampleInputEmail67" aria-describedby="emailHelp"
										width="300px" required>
								</p>
								<hr>
								<p class="inline-form">
									주거형태
									<fieldset>
                                    <div class="form-check1">
										<input class="form-check-input" type="radio"
											name="housingType" id="exampleRadios1" value="아파트"
											checked="checked">
                                        <label class="form-check-label"
											for="exampleRadios1">아파트</label>
                                    </div>
                                    <div class="form-check1">
										<input class="form-check-input" type="radio"
											name="housingType" id="exampleRadios2" value="단독주택"> <label
											class="form-check-label" for="exampleRadios2">단독주택</label>
                                    </div>
                                    <div class="form-check1">
										<input class="form-check-input" type="radio"
											name="housingType" id="exampleRadios3" value="연립주택"> <label
											class="form-check-label" for="exampleRadios3">연립/다세대/다가구</label>
                                    </div>
                                    <div class="form-check1">
										<input class="form-check-input" type="radio"
											name="housingType" id="exampleRadios4" value="기타"> <label
											class="form-check-label" for="exampleRadios4">기타</label>
                                    </div>
                                    <!-- End of Radio -->
                                </fieldset>
                                </p>
                                <hr>
                                <p class="inline-form">거주면적
                                
								<fieldset>
                                    <div class="form-check1">
										<input class="form-check-input" type="radio"
											name="residenceArea" id="exampleRadios1" value="10평이하"
											checked="checked">
                                        <label class="form-check-label"
											for="exampleRadios1">~33m2(10평이하)</label>
                                    </div>
                                    <div class="form-check1">
										<input class="form-check-input" type="radio"
											name="residenceArea" id="exampleRadios2" value="20평이하"> <label
											class="form-check-label" for="exampleRadios2">33.1~66m2(10.1~20평)</label>
                                    </div>
                                    <div class="form-check1">
										<input class="form-check-input" type="radio"
											name="residenceArea" id="exampleRadios3" value="30평이하"> <label
											class="form-check-label" for="exampleRadios3">66.1~99m2(20.1~30평)</label>
                                    </div>
                                    <div class="form-check1">
										<input class="form-check-input" type="radio"
											name="residenceArea" id="exampleRadios4" value="40평이하"> <label
											class="form-check-label" for="exampleRadios4">99.1~132m2(30.1~40평)</label>
                                    </div>
                                    <div class="form-check1">
										<input class="form-check-input" type="radio"
											name="residenceArea" id="exampleRadios5" value="40평초과"> <label
											class="form-check-label" for="exampleRadios5">132.1m2(40평 초과)</label>
                                    </div>
                                    <!-- End of Radio -->
                                </fieldset>
                                </p>
                                <hr>
                                <p class="inline-form">거주인원
                                
								<fieldset>
                                    <div class="form-check1">
										<input class="form-check-input" type="radio"
											name="people" id="exampleRadios1" value= 1
											checked="checked">
                                        <label class="form-check-label"
											for="exampleRadios1">1명</label>
                                    </div>
                                    <div class="form-check1">
										<input class="form-check-input" type="radio"
											name="people" id="exampleRadios2" value= 2> <label
											class="form-check-label" for="exampleRadios2">2명</label>
                                    </div>
                                    <div class="form-check1">
										<input class="form-check-input" type="radio"
											name="people" id="exampleRadios3" value= 3> <label
											class="form-check-label" for="exampleRadios3">3명</label>
                                    </div>
                                    <div class="form-check1">
										<input class="form-check-input" type="radio"
											name="people" id="exampleRadios4" value= 4> <label
											class="form-check-label" for="exampleRadios4">4명</label>
                                    </div>
                                    <div class="form-check1">
										<input class="form-check-input" type="radio"
											name="people" id="exampleRadios5" value= 5> <label
											class="form-check-label" for="exampleRadios5">5명</label>
                                    </div>
                                    <div class="form-check1">
										<input class="form-check-input" type="radio"
											name="people" id="exampleRadios6" value= 6> <label
											class="form-check-label" for="exampleRadios6">6명 이상</label>
                                    </div>
                                </fieldset>
                                </p>
                                <hr>
		<!-- 개인정보 수집 및 이용 동의 섹션 -->
		<div class="inline-form">
		    <div class="col-12 col-md-10 col-lg-6">
		        <div class="alert shadow-inset" style="width: 200%;">
		            <!-- 개인정보 수집 안내 및 링크 -->
		            <div class="d-flex">
		                <div class="alert-inner--text">
		                    <a target="_blank" href="https://themesberg.com/docs/neumorphism-ui/components/bootstrap-carousels/">
		                        <h4>개인정보 수집·이용 동의</h4><br>
		                        TEAM CARINA는 탄소발자국 계산기 결과값 계산 및 사용현황 분석을 위해 다음과 같이 개인정보를 수집·이용합니다.<br><br>
		                        - 수집하는 개인정보 항목: 이름, 주거형태, 주거면적, 거주인원<br>
		                        - 개인정보의 수집 및 이용목적: 탄소발자국 계산기 결과값 계산 및 사용현황 분석<br>
		                        - 개인정보의 보유 및 이용기간: 5년<br><br>
		                        ※ 사용자는 개인정보 수집 및 이용을 거부할 권리가 있습니다. 단, 탄소발자국 계산기 계산결과 제공이 불가합니다.<br>
		                        ※ 본 개인정보 수집·이용 목적은 사용자 식별이 아니므로 이름 대신 별명이나 식별 불가한 정보를 입력하셔도 무관합니다.
		                    </a> 
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
                                <div class="d-flex">
                                    <div class="form-check square-check">
										<input class="form-check-input" type="checkbox" value=""
											id="defaultCheck222"> <label class="form-check-label"
											for="defaultCheck222"> 개인정보 수집 및 이용에 동의함</label>
									</div>
                                    <button
										class="btn btn-primary text-secondary ml-10" type="button" id="saveButton"
										style="width:200px;">저장</button>
                                </div>
                  </div>
                 

                            <div class="tab-pane fade"
								id="tabs-icons-text-2" role="tabpanel"
								aria-labelledby="tabs-icons-text-2-tab">
									<div id="resultContainer">123</div>
                                <div class="col-12 col-lg-12">
                                    <div
										class="card bg-primary shadow-inset border-light w-100">
                                        <div class="card-body p-5 ">
 											
         									

                                            <h3
												class="h4 card-title mb-3">
												<strong>TEST RESULT</strong>
												
											</h3>

												<canvas id="myDoughnutChart"></canvas>
		
											<span class="card-text small"> ㅇㅇ님의 이산화탄소 발생량 통계입니다.
                                            </span>
                                            <p id="carbonEmissionInfo" class="card-text mt-4">ㅇㅇ 님 가정은 이산화탄소 배출량은 총 12kg 이며,
                                                비슷한 다른 가정 평균 343.8kg 보다 약 0% 더 많이 배출하고 있습니다.
                                                12kg의 이산화탄소 를 상쇄시키기 위해서는 2.9 그루의 소나무를 심어야 합니다.
                                                왼쪽의 그래프를 보고 어느 부분에서 이산화탄소를 많이 발생하고 있는지 비교해 보세요.</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="container no-gutters"
									style="margin-top: 20px;">
                                    <div class="row">
                                        <div class="col-12 col-lg-3">
                                            <!-- 첫 번째 작은 컨테이너 -->
                                            <div
												class="card bg-primary shadow-soft border-light w-100"
												style="height: 200px;">
                                                <!-- 내용 -->
                                                <p>Co2 발생량</p>
                                                <canvas id="totalChart" style="width: 80%; height: 80%;"></canvas>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-3">
                                            <!-- 두 번째 작은 컨테이너 -->
                                            <div
												class="card bg-primary shadow-soft border-light w-100"
												style="height: 200px;">
                                                <!-- 내용 -->
                                                <p>전기</p>
                                                <canvas id="electricityChart" style="width: 80%; height: 80%;"></canvas>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-3">
                                            <!-- 세 번째 작은 컨테이너 -->
                                            <div
												class="card bg-primary shadow-soft border-light w-100"
												style="height: 200px;">
                                                <!-- 내용 -->
                                                <p>가스</p>
                                                <canvas id="gasChart" style="width: 80%; height: 80%;"></canvas>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-3">
                                            <!-- 네 번째 작은 컨테이너 -->
                                            <div
												class="card bg-primary shadow-soft border-light w-100"
												style="height: 200px;">
                                                <!-- 내용 -->
                                                <p>수도</p>
                                                <canvas id="waterChart" style="width: 80%; height: 80%;"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade"
								id="tabs-icons-text-3" role="tabpanel"
								aria-labelledby="tabs-icons-text-3-tab">
                                <div class="row">
                                    <!-- 왼쪽 탭 메뉴 -->
                                    <div class="col-md-6">
                                        <div class="col-md-10 col-lg-8">
											<!-- Tab Nav -->
                                            <div
												class="nav-wrapper position-relative mb-4">
                                                <ul
													class="nav nav-pills-u flex-column flex-sm-row "
													id="tabs-text" role="tablist">
                                                    <li
														class="nav-item mr-sm-3 mr-md-0"><a
														class="nav-link mb-sm-3 mb-md-0 active"
														id="tabs-text-1-tab" data-toggle="tab" href="#tabs-text-1"
														role="tab" aria-controls="tabs-text-1"
														aria-selected="true">전기</a></li>
                                                    <li
														class="nav-item mr-sm-3 mr-md-0"><a
														class="nav-link mb-sm-3 mb-md-0" id="tabs-text-2-tab"
														data-toggle="tab" href="#tabs-text-2" role="tab"
														aria-controls="tabs-text-2" aria-selected="false">가스</a>
                                                    </li>
                                                    <li
														class="nav-item mr-sm-3 mr-md-0"><a
														class="nav-link mb-sm-3 mb-md-0" id="tabs-text-3-tab"
														data-toggle="tab" href="#tabs-text-3" role="tab"
														aria-controls="tabs-text-3" aria-selected="false">수도</a>
                                                    </li>
                                                </ul>
                                            </div>
											<!-- End of Tab Nav -->
											<!-- Tab Content -->
                                            <div
												class="card shadow-inset bg-primary border-light p-4 rounded">
                                                <div
													class="card-body p-4 "
													style="overflow-x: auto; overflow-y: auto;">
                                                    <div
														class="tab-content" id="tabcontent1">
                                                        <div
															class="tab-pane fade show active" id="tabs-text-1"
															role="tabpanel" aria-labelledby="tabs-text-1-tab"
															style=" text-align: center;">
                                                            <h3>
																<strong>전기</strong>
															</h3>
                                                            <table
																class="table table-hover shadow-inset rounded" id="electricityTable">
                                                                <tr>
                                                                    <td data-co2="3.2" data-cost="1293"  class="clickable-cell">하루 1시간은 에어컨 대신 선풍기로!</td>
                                                                </tr>
                                                                <tr>
                                                                    <td data-co2="0.6" data-cost="226" class="clickable-cell">세탁은 모아서 해도 잘 된답니다.</td>
                                                                </tr>
                                                                <tr>
                                                                    <td data-co2="5.9" data-cost="2368" class="clickable-cell">전기밥솥 보온기능은 전기 먹는 하마</td>
                                                                </tr>
                                                                <tr>
                                                                    <td data-co2="1.6" data-cost="653" class="clickable-cell">컴퓨터 절전프로그램(그린터치) 사용</td>
                                                                </tr>
                                                                <tr>
                                                                    <td data-co2="1.8" data-cost="725" class="clickable-cell">TV 시청 줄이고 가족과 대화 늘리고!</td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <div
															class="tab-pane fade" id="tabs-text-2" role="tabpanel"
															aria-labelledby="tabs-text-2-tab"
															style=" text-align: center;">
                                                            <h3>
																<strong>가스</strong>
															</h3>
                                                            <table
																class="table table-hover shadow-inset rounded" id="gasTable">
                                                                <tr>
                                                                    <td data-co2="14.6" data-cost="5427" class="clickable-cell" >겨울철 난방온도는 20℃가 적당해요.</td>
                                                                </tr>
                                                                <tr>
                                                                    <td data-co2="28.3" data-cost="10518" class="clickable-cell">보일러 사용시간 1시간만 줄여요.</td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <div
															class="tab-pane fade" id="tabs-text-3" role="tabpanel"
															aria-labelledby="tabs-text-3-tab"
															style=" text-align: center;">
                                                            <h3>
																<strong>수도</strong>
															</h3>
                                                            <table
																class="table table-hover shadow-inset rounded" id="waterTable">
                                                                <tr>
                                                                    <td data-co2="3.9" data-cost="7760" class="clickable-cell">절수기로 물낭비를 쉽게 막아요.</td>
                                                                </tr>
                                                                <tr>
                                                                    <td data-co2="0.4" data-cost="804" class="clickable-cell">물을 받아서 설거지 해요.</td>
                                                                </tr>
                                                                <tr>
                                                                    <td data-co2="0.6" data-cost="1090" class="clickable-cell">짧게 샤워하는 그대가 진정한 멋쟁이!</td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
											<!-- End of Tab Content -->
                                        </div>
                                    </div>

                                    <!-- 오른쪽 영역 -->
                                    <div class="col-md-6">
                                        <div class="row">
                                            <!-- 위쪽 세로로 나눈 영역 -->
                                            <div class="col-md-12 mb-5">
                                                <div
													class="card bg-primary shadow-soft border-light"
													style="width: 450px; height: 300px;">
                                                    <table
														class="table table-hover shadow-inset rounded">
                                                        <th>
                                                        
														<td>월간 co2저감 목표 및 비용 효과</td>
                                                        </th>
                                                        <tr>
                                                            <td>전기</td>
                                                            <td id="co2Electricity">0kg</td>
                                                            <td id=costElectricity>0원</td>
                                                        </tr>
                                                        <tr>
                                                            <td>가스</td>
                                                            <td id="co2Gas">0kg</td>
                                                            <td id="costGas">0원</td>
                                                        </tr>
                                                        <tr>
                                                            <td>수도</td>
                                                            <td id="co2Water">0kg</td>
                                                            <td id="costWater">0원</td>
                                                        </tr>
                                                        <tr>
                                                            <td>합계</td>
                                                            <td id="totalCo2">0kg</td>
                                                            <td id="totalCost">0원</td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>

                                            <!-- 아래쪽 세로로 나눈 영역 -->
                                            <div class="col-md-12">
                                                <div
													class="card bg-primary shadow-soft border-light"
													style="width: 450px; height: 200px;">
   														<canvas id="useBarChart"></canvas>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="tab-pane fade"
								id="tabs-icons-text-4" role="tabpanel"
								aria-labelledby="tabs-icons-text-4-tab ">
                                <div
									class="card flex-grow-1 bg-primary shadow-soft border-light text-center mb-4"
									style="width: 1050px;">
                                    <!-- 첫 번째 컨테이너 -->
                                    <strong id="userName">ㅇㅇ님 가정의 종합평가
                                    </strong>
                                </div>
                                <div class="container">
                                    <div class="row">
                                        <!-- 왼쪽 컨테이너 (가로 4) -->
                                        <div class="col-5">
                                            <div
												class="card bg-primary shadow-soft border-light text-center"
												style="overflow-x: auto;">
                                                <!-- 내용 -->
                                                <strong>이산화탄소 배출현황 및 비교</strong>
                                               <canvas id="co2comparison" style="width: 90%; height: 90%;"></canvas> <br>
                                                <p id="co2ComparisonText"> <br><br>
                                                    <br><br>
                                                    </p>
                                            </div>
                                        </div>

                                        <!-- 오른쪽 컨테이너 (가로 6) -->
                                        <div class="col-7">
                                            <div
												class="card bg-primary shadow-soft border-light text-center">
                                                <!-- 내용 -->
                                                <strong>부분별 배출현황 및 비교</strong>
                                                <div
													class="container mt-4">
                                                    <div class="row">
                                                        <div
															class="col-6">
                                                            <div
																class="card bg-primary shadow-soft border-light">
                                                                <!-- 내용 -->
                                                                <p>전기</p>
   																<canvas id="eCO2BarChart" style="width: 90%; height: 90%;"></canvas> <br>
                                                            </div>
                                                        </div>
                                                        <!-- 두 번째 컨테이너 (가로 6) -->
                                                        <div
															class="col-6">
                                                            <div
																class="card bg-primary shadow-soft border-light">
                                                                <!-- 내용 -->
                                                                 <p>수도</p>
                                                                <canvas id="wCO2BarChart" style="width: 90%; height: 90%;"></canvas> <br> <br>
                                                            </div>
                                                        </div>
                                                        <!-- 세 번째 컨테이너 (가로 6) -->
                                                        <div
															class="col-6 mt-4 mb-3">
                                                            <div
																class="card bg-primary shadow-soft border-light">
                                                                <!-- 내용 -->
                                                                 <p>가스</p>
                                                                <canvas id="gCO2BarChart" style="width: 90%; height: 90%;"></canvas> <br> <br>
                                                            </div>
                                                        </div>
                                                        <!-- 네 번째 컨테이너 (가로 6) -->
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div
														class="card bg-primary shadow-soft border-light"
											
														style="height: 250px;width: 210%; overflow-x: auto;" >
                                                       <p id="userInfo"></p>
                                                        <div
															class="row justify-content-center" id="downloadButton">
                                                            <div
																class="col-12 col-md-10 col-lg-10">
                                                                <div
																	class="alert shadow-inset">
                                                                    <div
																		class="d-flex">
                                                                            
																		<button class="btn btn-primary text-success ml-4"
																		id="sendReport"
																		type="button"
																		
																			>보고서 이동</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
			<!-- End of Tab Content -->
            </div>

	<%@include file="/WEB-INF/inc/footer.jsp"%>

	</body>
</html>