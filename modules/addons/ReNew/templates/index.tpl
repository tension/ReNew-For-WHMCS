<div class="page-content">
    <div class="container">
	    <div class="content-header">
			<div class="header-title">
				<h1>{$pagetitle}</h1>
			</div>
			<div class="header-toolbar"></div>
		</div>
		<div class="panel">
			<div class="panel-table">
				<div class="table-container clearfix">
				    <div id="tableServicesList_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					    <div class="listtable">
						    <table id="tableServicesList" class="table table-list dataTable no-footer dtr-inline" aria-describedby="tableServicesList_info" role="grid">
						        <thead>
						            <tr role="row">
							            <th class="sorting_asc">产品/服务</th>
							            <th class="hidden-xs sorting">续费价格</th>
							            <th class="hidden-xs sorting">购买日期</th>
							            <th class="hidden-xs sorting">下次付款日期</th>
							            <th class="sorting_asc" style="text-align: right;">状态</th>
							        </tr>
						        </thead>
						        <tbody>
							        {foreach $product as $value}
						            <tr onclick="clickableSafeRedirect(event, '{$WEB_ROOT}/index.php?m=ReNew&amp;id={$value['id']}', false)">
						                <td class="sorting_1">
						                    <strong>{$value['productname']}</strong>
						                	<p class="mobile"><a href="#" target="_blank">{$value['domain']}</a></p>
						                </td>
						                <td class="hidden-xs">{$value['amount']}</td>
						                <td class="hidden-xs">{$value['regdate']}</td>
						                <td class="hidden-xs">{$value['nextduedate']}</td>
						                <td class="sorting_2 text-right">
							                <a href="{$WEB_ROOT}/index.php?m=ReNew&amp;id={$value['id']}" class="btn btn-sm btn-primary"><i class="md md-account-balance-wallet"></i> 续费</a>
							                </td>
						            </tr>
						            {/foreach}
						        </tbody>
						        {if !$product}
						        	<div class="text-center" style="margin: 50px 0;">
							            <div class="no-data-info">
							                <i class="fa fa-exclamation-triangle" style="color: #D32E1D;"></i> 暂时没有可续费产品
							            </div>
							        </div>
						        {/if}
						    </table>
				    	</div>
				    </div>
				</div>
			</div>
		</div>
    </div>
</div>