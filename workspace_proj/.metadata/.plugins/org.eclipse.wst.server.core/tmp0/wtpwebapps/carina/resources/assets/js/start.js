const main = document.querySelector("#main");
const qna = document.querySelector("#qna");
const result = document.querySelector("#result");
const endPoint = 10;
const select = [0, 0, 0, 0, 0, 0];
function calResult(){
  console.log(select);
  var result = select.indexOf(Math.max(...select));
  return result;
}
	
function setResult() {
	  let point = calResult();
	  // Check if infoList[point] exists before accessing its properties
	  if (infoList && infoList[point]) {
	    const resultName = document.querySelector('.resultname');
	    resultName.innerHTML = infoList[point].name;
	    // const resultScore = document.querySelector('.resultScore');
	    // resultScore.innerHTML = infoList[point].score;
	    console.log(infoList[point]);
	   
	    const regex = /[^0-9]/g;
	    const result = infoList[point].score.replace(regex, "");
	    const numberArray = result.split('').map(Number);
	    let a, b, c, d;
	    for (let i = 0; i < 4; i++) {
	        if (i === 0) a = numberArray[i];
	        else if (i === 1) b = numberArray[i];
	        else if (i === 2) c = numberArray[i];
	        else if (i === 3) d = numberArray[i];
	    }
	    const progressPercentageA = 25 * a;
	    const progressPercentageB = 25 * b;
	    const progressPercentageC = 25 * c;
	    const progressPercentageD = 25 * d;
	    // Populate the progress bars container
	    const progressBarsContainer = document.getElementById('progressBarsContainer');
	    progressBarsContainer.innerHTML = `
	        <div class="container">
	            <div class="row justify-content-center mt-3">
	                <div class="col-12 col-lg-11 ">
	                   
	                    <!-- Progress Bar for '행동력' -->
	                    <div class="progress-wrapper mb-5">
	                        <div class="progress-info info-xl">
	                            <div class="progress-label"><span class="text-dark" style="font-size : 1.5rem">행동력</span></div>
	                            <div class="progress-percentage"><span style="font-size : 1.5rem">${progressPercentageA}%</span></div>
	                        </div>
	                        <div class="progress progress-xl">
	                            <div class="progress-bar progress-bar-striped bg-dark " role="progressbar"
	                                style="width: ${progressPercentageA}%" aria-valuenow="${progressPercentageA}" aria-valuemin="0"
	                                aria-valuemax="100"></div>
	                        </div>
	                    </div>
	                    <!-- Progress Bar for '환경공감력' -->
	                    <div class="progress-wrapper mb-5">
	                        <div class="progress-info info-xl">
	                            <div class="progress-label"><span class="text-gray " style="font-size : 1.5rem">환경공감력</span></div>
	                            <div class="progress-percentage"><span style="font-size : 1.5rem">${progressPercentageB}%</span></div>
	                        </div>
	                        <div class="progress progress-xl">
	                            <div class="progress-bar progress-bar-striped bg-gray custom" role="progressbar"
	                                style="width: ${progressPercentageB}%" aria-valuenow="${progressPercentageB}" aria-valuemin="0"
	                                aria-valuemax="100"></div>
	                        </div>
	                    </div>
	                    <!-- Progress Bar for '환경소비력' -->
	                    <div class="progress-wrapper mb-5">
	                        <div class="progress-info info-xl">
	                            <div class="progress-label"><span class="text-success" style="font-size : 1.5rem">환경소비력</span></div>
	                            <div class="progress-percentage"><span style="font-size : 1.5rem">${progressPercentageC}%</span></div>
	                        </div>
	                        <div class="progress progress-xl" >
	                            <div class="progress-bar bg-success custom" role="progressbar"
	                                style="width: ${progressPercentageC}%" aria-valuenow="${progressPercentageC}" aria-valuemin="0"
	                                aria-valuemax="100"></div>
	                        </div>
	                    </div>
	                    <!-- Progress Bar for '환경 매너력' -->
	                    <div class="progress-wrapper mb-5">
	                        <div class="progress-info info-xl">
	                            <div class="progress-label"><span class="text-info" style="font-size : 1.5rem">환경 매너력</span></div>
	                            <div class="progress-percentage"><span style="font-size : 1.5rem">${progressPercentageD}%</span></div>
	                        </div>
	                        <div class="progress progress-xl">
	                            <div class="progress-bar progress-bar-striped bg-info custom" role="progressbar"
	                                style="width: ${progressPercentageD}%" aria-valuenow="${progressPercentageD}" aria-valuemin="0"
	                                aria-valuemax="100"></div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>`;
	   
	    var resultImg = document.createElement('img');
	    const imgDiv = document.querySelector('#resultImg');
	    var imgURL = './assets/img/mbti/image-' + point + '.png';
	    resultImg.src = imgURL;
	    resultImg.alt = point;
	    resultImg.classList.add('img-fluid');
	    imgDiv.appendChild(resultImg);
	    const resultDesc = document.querySelector('.resultDesc');
	    resultDesc.innerHTML = infoList[point].desc;
	  } else {
	    console.error("Invalid infoList index:", point);
	  }
	}
	
function goResult(){
  qna.style.WebkitAnimation = "fadeOut 1s";
  qna.style.animation = "fadeOut 1s";
  setTimeout(() => {
    result.style.WebkitAnimation = "fadeIn 1s";
    result.style.animation = "fadeIn 1s";
    setTimeout(() => {
      qna.style.display = "none";
      result.style.display = "block"
    }, 450)})
    setResult();
}
function addAnswer(answerText, qIdx, idx){
  var a = document.querySelector('.answerBox');
  var answer = document.createElement('button');
  answer.classList.add('btn');
  answer.classList.add('btn-primary1');
  answer.classList.add('mx-auto');
  answer.classList.add('fadeIn');
  answer.classList.add('mb-5');
  answer.style.textAlign = 'center'; // 텍스트 가운데 정렬
  answer.style.width = '90%'; // 모바일 화면에서는 너비를 100%로 설정
  
  a.appendChild(answer);
  answer.innerHTML = answerText;
  answer.addEventListener("click", function(){
    var children = document.querySelectorAll('.btn-primary1');
    for(let i = 0; i < children.length; i++){
      children[i].disabled = true;
      children[i].style.WebkitAnimation = "fadeOut 0.5s";
      children[i].style.animation = "fadeOut 0.5s";
    }
    setTimeout(() => {
      var target = qnaList[qIdx].a[idx].type;
      for(let i = 0; i < target.length; i++){
        select[target[i]] += 1;
      }
      for(let i = 0; i < children.length; i++){
        children[i].style.display = 'none';
      }
      goNext(++qIdx);
    },450)
  }, false);
}
function goNext(qIdx){
  if(qIdx === endPoint){
    goResult();
    return;
  }
  var q = document.querySelector('.qBox');
  q.innerHTML = qnaList[qIdx].q;
  for(let i in qnaList[qIdx].a){
    addAnswer(qnaList[qIdx].a[i].answer, qIdx, i);
  }
  var status = document.querySelector('.statusBar');
  status.style.width = (100/endPoint) * (qIdx+1) + '%';
}
function begin(){
  main.style.WebkitAnimation = "fadeOut 1s";
  main.style.animation = "fadeOut 1s";
  setTimeout(() => {
    qna.style.WebkitAnimation = "fadeIn 1s";
    qna.style.animation = "fadeIn 1s";
    setTimeout(() => {
      main.style.display = "none";
      qna.style.display = "block"
    }, 450)
    let qIdx = 0;
    goNext(qIdx);
  }, 450);
}