<?php
	
use WHMCS\Database\Capsule;

// PreCronJob
add_hook('AfterCronJob', 1, function() {
	try {
		$UnPaidinvoice = Capsule::table('mod_renewal')->where('status', 'UnPaid')->get();
		
		foreach ($UnPaidinvoice as $invoiceID) {
			
			//查询账单是否支付
	        $invoice = Capsule::table('tblinvoices')->where('id', $invoiceID->invoiceid)->where('status', 'Paid')->first();
	        
	        // 账单不为空
	        if ( !empty($invoice) ) {
		        
				$ReNewtype = Capsule::table('mod_renewal')->where('invoiceid', $invoiceID->invoiceid)->first()->type;
				$order = Capsule::table('tblhosting')->where('id', $invoiceID->serviceid)->where('userid', $invoiceID->userid)->first()->nextduedate;
				
				$endtime = date('Y-m-d H:i:s', strtotime("$order +".$ReNewtype."month"));
				
                //更新数据库
                Capsule::table('mod_renewal')->where('invoiceid', $invoice->id)->update([
                	'status'=> 'Paid',
                	'datepaid'=> date('Y-m-d H:i:s')
                ]);
				
                //更新数据库
                $result = Capsule::table('tblhosting')->where('id', $invoiceID->serviceid)->where('userid', $invoiceID->userid)->update([
                    //'firstpaymentamount' => $amount,
                    //'amount' 			   => $dueamount,
                    //'billingcycle' 	   => $billingcycle,
                    'nextduedate' 		=> $endtime,
                    'nextinvoicedate' 	=> $endtime,
                ]);

                if (!empty($result)) {
	                logActivity( 'Service ID: ' . $invoiceID->serviceid . ' - ReNew Successful!' );
                }
	        }
		}
		
	}
	catch (Exception $e) {
		logActivity( $e );
	}
});

add_hook('InvoicePaid', 1, function($vars) {
	try {
		$UnPaidinvoice = Capsule::table('mod_renewal')->where('status', 'UnPaid')->get();
		
		foreach ($UnPaidinvoice as $invoiceID) {
			
			//查询账单是否支付
	        $invoice = Capsule::table('tblinvoices')->where('id', $invoiceID->invoiceid)->where('status', 'Paid')->first();
	        
	        // 账单不为空
	        if ( !empty($invoice) ) {
		        
				$ReNewtype = Capsule::table('mod_renewal')->where('invoiceid', $invoiceID->invoiceid)->first()->type;
				$order = Capsule::table('tblhosting')->where('id', $invoiceID->serviceid)->where('userid', $invoiceID->userid)->first()->nextduedate;
				
				$endtime = date('Y-m-d H:i:s', strtotime("$order +".$ReNewtype."month"));
				
                //更新数据库
                Capsule::table('mod_renewal')->where('invoiceid', $invoice->id)->update([
                	'status'=> 'Paid',
                	'datepaid'=> date('Y-m-d H:i:s')
                ]);
                
                //更新数据库
                $result = Capsule::table('tblhosting')->where('id', $invoiceID->serviceid)->where('userid', $invoiceID->userid)->update([
                    //'firstpaymentamount' => $amount,
                    //'amount' 			   => $dueamount,
                    //'billingcycle' 	   => $billingcycle,
                    'nextduedate' 		=> $endtime,
                    'nextinvoicedate' 	=> $endtime,
                ]);

                if (!empty($result)) {
	                logActivity( 'Service ID: ' . $invoiceID->serviceid . ' - ReNew Successful!' );
                }
	        }
		}
		
	}
	catch (Exception $e) {
		logActivity( $e );
	}
});