$(function(){
  $( document ).on( 'keyup', '#item-price', function(){ 
  
    let amount = $( this ).val();
    console.log(amount)
    let tax = Math.ceil(amount * 0.1);
    
    let profit = Math.floor(amount * 0.9);
    
    $('#add-tax-price').html(tax);
    
    $('#profit').html(profit);
    
  });
 });