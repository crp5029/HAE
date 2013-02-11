$(function() {

    var newHash      = "",
        $pageDiv = $("#pageDiv"),
        $informationSection = $("#informationSection"),
        baseHeight   = 0,
        $el,
        $navMain = $("#navMain");
        
    $pageDiv.height($pageDiv.height());
    baseHeight = $pageDiv.height() - $informationSection.height();
    $navMain.delegate("a", "click", function() {
        window.location.hash = $(this).attr("href");
        return false;
    });
    $(window).bind('hashchange', function(){
        newHash = window.location.hash.substring(1);
        if (newHash) {
            $informationSection
                .find("#dynamicContentDiv")
                .fadeOut(200, function() {
                    $informationSection.hide().load(newHash + " #dynamicContentDiv", function() {
                        $informationSection.fadeIn(200, function() {
                            $pageDiv.animate({
                                height: baseHeight + $informationSection.height() + "px"
                            });
                        });
                        $($navMain + "a").removeClass("current");
                        $($navMain + "a[href="+newHash+"]").addClass("current");
                    });
                });
        };
        
    });
    
    $(window).trigger('hashchange');

});

function popup() {
	
	//var $pageDiv = $("#pageDiv");
	//$pageDiv.find("#")
	//alert($pageDiv.height());
	//var popupDiv = document.URL("http://127.0.0.1:8020/HaeAdminTool/AdminToolGUI/EditItem.html");
		
	var popupDiv = document.createElement('div');
	var popupHeader = document.createElement('header');
	var popupHeading = document.createElement('h1');
	var popupSection = document.createElement('section');
	var popupContentDiv = document.createElement('div');
	var popupTable = document.createElement('table');
	var popupTBody = document.createElement('tbody');
	
	popupDiv.setAttribute('id', 'pageDiv');
	popupHeader.setAttribute('id', 'smallHeader');
	popupSection.setAttribute('id', 'informationSection');
	popupHeading.setAttribute('id', 'h1Test');
	popupContentDiv.setAttribute('id', 'dynamicContentDiv');
	popupTable.setAttribute('id', 'productList');
	popupTable.setAttribute('border', '1');
	popupHeading.innerHTML = 'TEST';
	
	document.body.appendChild(popupDiv);
	popupDiv.appendChild(popupHeader);
	popupHeader.appendChild(popupHeading);
	popupDiv.appendChild(popupSection);
	popupSection.appendChild(popupContentDiv);
	popupContentDiv.appendChild(popupTable);
	popupTable.appendChild(popupTBody);
	popupTBody.appendChild(createHeaderRow());
	popupTBody = createDataRows(popupTBody);

		
}

function createHeaderRow(){
	var popupTableRow = document.createElement('tr');
	var popupTableHeader = [];
	var popupTableHeaderItems = {
		col0: "Attribute",
		col1: "Current",
		col2: "New",
		col3: "Add Change to Queue"
	};
	
	for (var i=0; i < 4; i++) {
		var testString = "col" + i;
		popupTableHeader[i] = document.createElement('th');
		popupTableHeader[i].innerHTML = popupTableHeaderItems[testString];
		popupTableRow.appendChild(popupTableHeader[i]);
	};
	return popupTableRow;
}

function createDataRows(popupTBody){
	
	var popupTableButton = document.createElement('button');
	var	popupTableCell = document.createElement('td');
	var popupTableInputField = [];
	var popupTableButtonField = [];
	var dataRow1 = ["Available", "Yes"];
	var dataRow2 = ["Price","$4.50"];
	var dataRow3 = ["Product Image","Picture URL"];
	var dataArray = [dataRow1, dataRow2, dataRow3];
	
	for (var i=0; i < dataArray.length; i++){
		var popupTableRow = document.createElement('tr');
		popupTableInputField[i] = document.createElement('input');
		popupTableButtonField[i] = document.createElement('button');
		popupTableButtonField[i].innerHTML = "Update";
			
		for (var j=0; j < 2; j++) {
			popupTableCell = createTableCell();
			popupTableCell.innerHTML = dataArray[i][j].toString();
			popupTableRow.appendChild(popupTableCell);
		};
		popupTableCell = createTableCell();
		popupTableCell.appendChild(popupTableInputField[i]);					
		popupTableRow.appendChild(popupTableCell);
		
		
		popupTableCell = createTableCell();
		popupTableCell.appendChild(popupTableButtonField[i]);					
		popupTableRow.appendChild(popupTableCell);		
		
		popupTBody.appendChild(popupTableRow);
	};	
	
	return popupTBody;
}

function createTableCell() {
	var	tableCell = document.createElement('td');	
	tableCell.setAttribute('id', 'productRow');	
	return tableCell;
}

