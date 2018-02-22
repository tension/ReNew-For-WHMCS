<div class="page-content">
    <div class="container">
		<div class="panel panel-hero" style="border: none">
			<div class="panel-body" style="border: none">
<link href="{$WEB_ROOT}/modules/addons/ReNew/templates/assets/css/clientarea.css?v31" rel="stylesheet" type="text/css">
<script>
$(function(){
	
	$('.slider-date li').click(function() {
		
		var index = $(this).data('time');
		var date = $(this).data('date');
		var amount = "{$results['amount']}";
		
        if ( index < 10 ) {
            $(this).siblings().removeClass('active before');
            $(this).addClass('active before');
        } else {
            $(this).siblings().removeClass('active before');
            $(this).addClass('active');
        }
		
        console.log( index );
		
		$.ajax({
			cache: false,
			type: 'GET',
			url: '{$WEB_ROOT}/index.php?m=ReNew&id={$id}&time='+ index +'&date='+date,
			dataType:'json',
			async: true,
			beforeSend: function () {
				// 显示
				$('#ordertime').html('正在计算...');
				$('.balance').html('<small>正在计算...</small>');
			},
			success: function (data) {
				if (data.status == 'success') {
					$('#ordertime').html(data.date);
					$('.balance').html(data.price);
				}
				$('input[name="timeCycle"]').val(index);
				$('input[name="priceCycle"]').val(date);
			}
		});
	});
	
	var index = $('.slider-date li:first-child').data('time');
	var date = $('.slider-date li:first-child').data('date');
	$.ajax({
		cache: false,
		type: 'GET',
		url: '{$WEB_ROOT}/index.php?m=ReNew&id={$id}&time='+ index +'&date='+date,
		dataType:'json',
		async: true,
		beforeSend: function () {
			// 显示
			$('#ordertime').html('正在计算...');
			$('.balance').html('<small>正在计算...</small>');
		},
		success: function (data) {
			if (data.status == 'success') {
				$('#ordertime').html(data.date);
				$('.balance').html('<span class="price">' + data.price + '</span>');
			}
			$('input[name="timeCycle"]').val(index);
			$('input[name="priceCycle"]').val(date);
		}
	});
});
</script>

<div class="row">
	<div class="col-sm-10 col-sm-offset-1">
		<div class="row">
				
			<div class="col-sm-12">
		    	<div class="empty" style="height: 30px;"></div>
			</div>
			
			<div class="col-sm-12">
                <div class="item clearfix short">
                    <span class="label">产品名称：</span>
                    <div class="contents">{$results['productname']}</div>
                </div>
                <div class="item clearfix short right">
                    <span class="label">标识名称：</span>
                    <div class="contents">{$results['domain']}</div>
                </div>
                <div class="item clearfix short">
                    <span class="label">支付方式：</span>
                    <div class="contents">
                        <i class="payment-{$results['payment']}"></i>
                        {$results['paymentmethod']}
                    </div>
                </div>
                <div class="item clearfix short right">
                    <span class="label">购买周期：</span>
                    <div class="contents">{$results['billingcycle']}</div>
                </div>
                <div class="item clearfix short">
                    <span class="label">购买日期：</span>
                    <div class="contents">{$results['regdate']}</div>
                </div>
                <div class="item clearfix short right">
                    <span class="label">到期时间：</span>
                    <div class="contents"><span class="bk-order-time-color">{if $results['nextduedate'] == '0000-00-00'}无限期{else}{$results['nextduedate']}{/if}</span></div>
                </div>
                <div class="item clearfix short">
                    <span class="label">购买金额：</span>
                    <div class="contents">{$results['firstpaymentamount']}</div>
                </div>
                <div class="item clearfix short right">
                    <span class="label">续费金额：</span>
                    <div class="contents">{$results['amount']}</div>
                </div>
		    </div>
				
			{if $results['paytype'] == 'recurring'}
			<div class="col-sm-12">
		    	<div class="empty" style="height: 30px;"></div>
			</div>
			<div class="col-sm-12">
				<h5 class="text-center">选择时长</h5>
			</div>
			<div class="col-sm-12">
		    	<div class="empty" style="height: 30px;"></div>
			</div>
			<form method="POST" action="{$WEB_ROOT}/index.php?m=ReNew" class="col-sm-12">
			<input type="hidden" name="id" value="{$id}" />
			<input type="hidden" name="timeCycle" value="1" />
			<input type="hidden" name="priceCycle" value="1" />
				<div class="col-sm-12">
					<div class="renew-main">
						<div class="slider-date">
					        <ul class="slider-bg clearfix">
						        {$results['billingCycle']}
					        </ul>
					    </div>
					    <div class="bk-order-renew-new-time">续费后到期时间为 <span id="ordertime" class="bk-order-time-color"></span></div>
					</div>
			    </div>
			    
				<div class="col-sm-12">
			    	<div class="text-right">
				    	<div class="total">
					    	应付款：
					    	<span class="balance">
					    		<span class="price"></span>
					    	</span>
				    	</div>
			    	</div>
				</div>
				
				<div class="col-sm-12">
					<div class="text-right">
						<button type="submit" class="btn btn-bk">
							<i class="md md-assignment-turned-in"></i> 确认续费
						</button>
					</div>
				</div>
			</form>
			
			{else}
			
			<div class="col-sm-12 push-t-30">
				<div class="alert alert-danger"><i class="alico icon-warning-2"></i> 当前产品无需续费。</div>
			</div>
			
			{/if}
		</div>
	</div>
</div>
			</div>
		</div>
    </div>
</div>