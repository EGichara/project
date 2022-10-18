<?php
if(isset($_GET['ids'])){
    $vehicles = $conn->query("SELECT *,Concat(code,' - ',`name`) as vehicle FROM `vehicle_list` where id in (SELECT vehicle_id FROM `schedule_list` where delete_flag = 0 and id in (SELECT schedule_id FROM `reservation_list` where id in ({$_GET['ids']}) ) )");
    $res = $vehicles->fetch_all(MYSQLI_ASSOC);
    $vehicle_fcf_arr = array_column($res,'first_class_capacity','id');
    $vehicle_ef_arr = array_column($res,'economy_capacity','id');
    $vehicle_arr = array_column($res,'vehicle','id');
    $qry = $conn->query("SELECT r.*,s.code as sched_code,s.vehicle_id from `reservation_list` r inner join `schedule_list` s on r.schedule_id = s.id where r.id in ({$_GET['ids']}) ");
    if($qry->num_rows > 0){
        $res = $qry->fetch_all(MYSQLI_ASSOC);
    }else{
        echo '<script> alert("Unkown Reservation ID(s).");location.replace("./?page=schedules") </script>';
    }
} else{
    echo '<script> alert("Reservation ID(s) is required to view this page.");location.replace("./?page=schedules") </script>';
}
$vehicle_group = ['','Seater','Shuttle'];
?>
<div class="content py-5">
    <div class="card rounded-0 card-outline card-primary shadow "style="border-color: green;">
        <div class="card-header rounded-0">
            <h5 class="card-title">Generated Tickets</h5>
            <div class="card-tools">
                <button class="btn btn-sm btn-flat btn-success" id="print"><i class="fa fa-print"></i> Print</button>
            </div>
        </div>
        <div class="card-body rounded-0">
            <div id="outprint" class="list-group">
                <style>
                    .logo {
                        width: 50px;
                        height: 50px;
                        object-fit: scale-down;
                        object-position: center center;
                        left: 17.33%;
                        position: relative;
                        top: -0.33em;
                        border: 1px solid black;
                        border-radius: 50% 50%;
                    }
                    .tickets{
                        border-bottom: 3px dashed
                    }
                </style>
                <?php foreach($res as $row): ?>
                <div class="list-group-item tickets py-5">
                    <div class="row align-items-center">
                        <div class="col-1 text-center">
                        </div>
                        <div class="col-12 text-center">
                            <img src="<?= validate_image($_settings->info('logo')) ?>" alt="logo" class="logo float-left">
                            <h3 class="m-0 text-center"><?= $_settings->info('name') ?></h3>
                            <h5 class="m-0 text-center">Reservation Ticket</h5>
                        </div>
                    </div>
                    <hr>
                    <div class="clear-fix my-5"></div>
                    <div class="row">
                        <div class="col-auto pr-2"><b>Schedule Code:</b></div>
                        <div class="col-auto flex-grow-1 border-bottom border-dark"><b><?= $row['sched_code'] ?></b></div>
                        <div class="col-auto pl-4 pr-2"><b>Vehicle:</b></div>
                        <div class="col-auto flex-grow-1 border-bottom border-dark"><b><?= isset($vehicle_arr[$row['vehicle_id']]) ? $vehicle_arr[$row['vehicle_id']] : "N/A" ?></b></div>
                    </div>
                    <div class="row">
                        <div class="col-auto pr-2"><b>Schedule:</b></div>
                        <div class="col-auto flex-grow-1 border-bottom border-dark"><b><?= date("M d, Y h:i A", strtotime($row['schedule'])) ?></b></div>
                        <div class="col-auto pl-4 pr-2"><b>Seat #:</b></div>
                        <div class="col-auto flex-grow-1 border-bottom border-dark"><b><?= $row['seat_num'] ?></b></div>
                        <div class="col-auto pl-4 pr-2"><b>Group:</b></div>
                        <div class="col-auto flex-grow-1 border-bottom border-dark"><b><?= $vehicle_group[$row['seat_type']] ?></b></div>
                    </div>
                    <div class="row">
                        <div class="col-auto pr-2"><b>Passenger Name:</b></div>
                        <div class="col-auto flex-grow-1 border-bottom border-dark"><b><?= strtoupper($row['lastname'].', '.$row['firstname'].' '.$row['middlename']) ?></b></div>
                    </div>
                    <div class="clear-fix my-5"></div>
                </div>
                <?php endforeach; ?>
                <br><br>
                <center>
                <div>
    <a href="checkout.php"class="btn btn-sm btn-primary btn-flat"style ="background-color: green;align-items: center;">Proceed to Checkout</a>
    </center>
</div>
            </div>
        </div>
    </div>
</div>

<script>
   
   $(function(){
    $('#print').click(function(){
        var _h = $("head").clone()
        var _p = $("#outprint").clone();
        var el = $("<div>");
            el.append(_h)
            el.append(_p)
        start_loader()
        var nw = window.open('','_blank','width=1000,height=720,top=100,left=100')
            nw.document.write(el.html())
            nw.document.close()
            setTimeout(() => {
                nw.print()
                setTimeout(() => {
                    nw.close()
                    end_loader();
                }, 500);
            }, 750);

    })
   })
    
</script>