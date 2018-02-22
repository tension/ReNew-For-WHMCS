<link rel="stylesheet" href="{$assets}assets/select2/select2.min.css">
<link rel="stylesheet" href="{$assets}assets/select2/select2-bootstrap.min.css">
<link rel="stylesheet" href="{$assets}assets/css/style.css?2">
<!-- Page JS Plugins CSS -->
<link rel="stylesheet" href="{$assets}assets/datatables/jquery.dataTables.min.css">
<!-- Page JS Plugins -->
<script src="{$assets}assets/datatables/jquery.dataTables.min.js"></script>
<!-- Page JS Code -->
<script src="{$assets}assets/js/base_tables_datatables.js"></script>
<style type="text/css">
    h1 {
        display: none;
    }
</style>

{include file="./navbar.tpl"}

<div class="row">
    <div class="col-md-12">
		{if $notice}
	        {$notice}
	    {/if}
    </div>
    <div class="col-md-12">
	    <div class="block block-rounded block-bordered">
		    <div class="block-content" style="padding:0">
		        <table id="license-list" class="table table-hover js-dataTable-full" style="margin-bottom:0">
			        <colgroup>
			        	<col width="5%">
			        	<col width="5%">
			        	<col width="5%">
			        	<col width="5%">
			        	<col width="5%">
			        	<col width="10%">
			        	<col width="10%">
			        	<col width="10%">
			        </colgroup>
		            <thead>
			            <tr>
			                <th>#ID</th>
			                <th>用户</th>
			                <th>服务ID</th>
			                <th>账单ID</th>
			                <th class="hidden-xs">支付金额</th>
			                <th class="hidden-xs">创建时间</th>
			                <th class="hidden-xs">支付时间</th>
			                <th class="text-center">状态</th>
			            </tr>
		            </thead>
		            <tbody>
		            {if $renew}
		                {foreach $renew as $value}
		                    <tr id="renew_{$value['id']|trim}">
		                        <td>#{$value['id']}</td>
		                        <td><a href="clientssummary.php?userid={$value['userid']}">{$value['name']}</a></td>
		                        <td><a href="clientsservices.php?productselect={$value['serviceid']}">{$value['serviceid']}</a></td>
		                        <td><a href="invoices.php?action=edit&id={$value['invoiceid']}">{$value['invoiceid']}</a></td>
		                        <td class="hidden-xs">{$value['subtotal']}</td>
		                        <td class="hidden-xs">{$value['date']|date_format:"%Y-%m-%d"}</td>
		                        <td class="hidden-xs">{$value['datepaid']|date_format:"%Y-%m-%d"}</td>
		                        <td class="text-center">
			                        {if $value['status'] == 'Cancelled'}
			                        	<span style="color:#888888">{$value['status']}</span>
			                        {else if $value['status'] == 'Cancelled'}
			                        	<span style="color:#cc0000">Pending</span>
			                        {else}
			                        	<span style="color:#779500">Paid</span>
			                        {/if}
		                        </td>
		                    </tr>
		                {/foreach}
		            {else}
		                <tr id="message">
		                    <td colspan="6" class="text-center">
		                        当前还没有添加任何内容
		                    </td>
		                </tr>
		            {/if}
		            </tbody>
		        </table>
		    </div>
		</div>
    </div>
    <div class="col-xs-12 foot text-center">
        <p>Copyright &copy NeWorld Cloud Ltd. All Rights Reserved.</p>
    </div>
</div>
<script>
    $(function() {
		$('.js-select2').select2({
			minimumResultsForSearch: Infinity,
			width: '100%'
		});
    });
</script>
<script src="{$assets}assets/select2/select2.full.min.js"></script>