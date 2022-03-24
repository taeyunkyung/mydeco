const quotes = [
    {
      quote: "오늘 운세는 최고야. 네가 선택한 길이 곧 정답이야.",
    },
    {
      quote: "오늘 운세는 좋아. 망설이던 일에 도전해보자.",
    },
    {
      quote: "오늘 운세는 나쁘지 않아. 조급해 하지 말고 차분하게 행동하자.",
    },
    {
      quote: "오늘 운세는 훌륭해. 원하는 바를 이룰 수 있을지도?",
    },
    {
      quote: "오늘 운세는 그럭저럭이네. 평범하게 멋진 하루를 보낼 것 같아.",
    },
    {
      quote: "오늘 운세는 평범해. 평화로운 하루를 보낼 것 같네.",
    },
    {
      quote: "오늘 운세는 불안불안하네. 기합으로 이겨내보자.",
    },
    {
      quote: "오늘 운세는 조금 안 좋네. 좀 더 조심스럽게 시작해볼까?",
    }
];


const quote = document.querySelector("#resultDesc span:first-child");
const todaysQuote = quotes[Math.floor(Math.random()*quotes.length)];
quote.innerText = todaysQuote.quote;


function begin(){
    firstSection.style.WebkitAnimation = "fadeOut 1s";
    firstSection.style.animation = "fadeOut 1s";
    setTimeout(() => {
      result.style.WebkitAnimation = "fadeIn 1s";
      result.style.animation = "fadeIn 1s";
      setTimeout(() => {
        firstSection.style.display = "none";
        result.style.display = "block"
      }, 450)
      let qIdx = 0;
    }, 450);
}

/* 버튼 도망다니는 기능 */
var flag = 1;
function run()
{
   if( flag == 1 )
   {
      document.getElementById("N").style.top = "175px";
      document.getElementById("N").style.left = "500px";
   }
   if( flag == 2 )
   {
      document.getElementById("N").style.top = "215px";
      document.getElementById("N").style.left = "100px";
   }
   if( flag == 3 )
   {
      document.getElementById("N").style.top = "300px";
      document.getElementById("N").style.left = "350px";
   }
   flag = flag + 1;
   if( flag == 4 )
   {
      flag = 1;
   }
};