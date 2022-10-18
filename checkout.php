
  <title>Payment</title>
  <?php 
session_start();

// database connections
$db = mysqli_connect('localhost', 'M.EDWIN', 'Eddy37115436', '4nte');
?>
  <?php 
  $qry = $db->query("SELECT * from `reservation_list`");
  while($row = $qry->fetch_assoc())
   {?>
  <form method="POST" action="https://checkout.flutterwave.com/v3/hosted/pay">
  <link rel="stylesheet" type="text/css" href="checkout.css">
  <center style="">
  <div>
  <br><br>

  
  <h3>TICKET COST <br> <span style="color:black;"><b><i><?php echo $row["fare_amount"]; ?> KSH</i></b></h3>
  <img src="uploads/image1.png">

  <style>
    body{
      background-image: url("uploads/mat1.jpg");
      background-size: cover;
      background-color: ghostwhite;
    }

    div{
      width: 300px;
      height: 300px;
      background-color: ghostwhite;
      text-align: center;
      padding: 20px;
      padding-bottom: 20px;
      border-radius: 25px;
      border: 2px solid #73AD21; 
      position:absolute;
      top:50%;
      left:50%;
      transform:translate(-50%,-50%);     
    }

    img{
      width: 100px;
      height: 100px;
    }

  </style>
  <input type="hidden" name="public_key" value="FLWPUBK_TEST-SANDBOXDEMOKEY-X" />
  <input type="hidden" name="customer[email]" value="edwin.gichara@strathmore.edu" />
  <input type="hidden" name="customer[name]" value="Edwin" />
  <input type="hidden" name="tx_ref" value="bitethtx-019203" />
  <input type="hidden" name="amount" value="<?php echo $row["fare_amount"]; ?>" />
  <input type="hidden" name="currency" value="KES" />
  <input type="hidden" name="meta[token]" value="54" />
  <input type="hidden" name="redirect_url" value="http://localhost/orrs/index.php" />
  <br><br>
  <button type="submit" id="start-payment-button">Pay Now</button>
  </div>
</form>
</center>
<?php  
}
?>