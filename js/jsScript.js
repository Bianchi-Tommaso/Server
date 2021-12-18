var z = 5;

function calcolo()
{   
    var x;
    var i = 0;
    var numeridivisibili = 0;
    
    x = document.getElementById("inputnumero").value;
    if(x == 0)
        {
        document.getElementById("risultato").innerHTML = 'Lo 0 Non Ha Divisori: ' + x;
        }
    else
        {
        for(i=1; i<x; i=i+1)
            {
                if((x % i)== 0)
                 numeridivisibili=numeridivisibili+1; 
            }
             numeridivisibili=numeridivisibili+1;
        }   
   
    if(x != 0)
        {
    if(numeridivisibili != 2)
        {
          document.getElementById("risultato").innerHTML = 'I Numeri Divisibili Sono: ' + numeridivisibili;
        }
    else 
        {
             document.getElementById("risultato").innerHTML = 'I Numeri Divisibili Sono: ' + numeridivisibili + ' Il Numero è Primo '; 
        }
        }
     
}

function controllo()
{
    var y;
    
    x = document.getElementById("inputnumero").value;
    if(x > 0 && x < 50)
        {
            document.getElementById("nascosto").style.display='block'
            document.getElementById("mostra").style.display='none'
            document.getElementById("colore").style.backgroundColor="#FFCC00"
        }
}

function compara()
{
    var x;
    var y;
    var i;
    
    y = document.getElementById("inputnumero-1").value
  x = document.getElementById("inputnumero").value;
    if(z >= 2)
        {
    if(x == y)
        {
             document.getElementById("risultato-1").innerHTML = 'Grande Bomber..\n You Win'; 
            setTimeout(function() {
  window.location.reload()
}, 1000);
        }
    else
        {
            z = z - 1;
            document.getElementById("inputnumero-1").value = ' '
           document.getElementById("risultato-1").innerHTML = 'ERRORE.. Il Numero Non E: ' + y + '\n' + ' Tentativi Rimanenti: ' + z + ' Riprova'; 
            
            
        }
        }
    else
        {
            document.getElementById("risultato-2").innerHTML = ' You Lose '; 
setTimeout(function() {
  window.location.reload()
}, 1000);
        }
   
}

function popup()
{
    var giocatore;
    var testo;
    var ciclo = 1;
    
    while(ciclo == 1)
        {
            giocatore = window.prompt("Inserisci Il Tuo Nome");
            if(giocatore == " " || giocatore == null)
                {
                }
            else
                {
                     ciclo = ciclo - 1;
                }
        }
    document.getElementsByid("cambia").innerHTML = giocatore; 
}


function conversione()
{
    var dollari = 1.09;
    var sterlina = 0.87;
    var yen = 117.29;
    var euro = 0;
    
    document.getElementById("favcolor").style.display='block';
    document.getElementById("dollari").style.display='block';
    document.getElementById("sterlina").style.display='block';
    document.getElementById("yen").style.display='block';
    euro = document.getElementById("Euro").value;    
    dollari = dollari * euro;
    sterlina = sterlina * euro;
    yen = yen * euro;
    document.getElementById("dollari").innerHTML = dollari.toFixed(2)
     document.getElementById("sterlina").innerHTML = sterlina.toFixed(2); 
     document.getElementById("yen").innerHTML = yen.toFixed(2); 
}

function colore()
{
var colore;
var nomi;
var i;
    
colore=document.getElementById("favcolor").value;
valute= document.getElementsByClassName("card-title");
for(i=0; i<valute.length;i++)
{
	valute[i].style.color= colore;
}
}

