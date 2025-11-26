sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"ust/purchaseorderapp/test/integration/pages/POList",
	"ust/purchaseorderapp/test/integration/pages/POObjectPage",
	"ust/purchaseorderapp/test/integration/pages/itemsObjectPage"
], function (JourneyRunner, POList, POObjectPage, itemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('ust/purchaseorderapp') + '/test/flp.html#app-preview',
        pages: {
			onThePOList: POList,
			onThePOObjectPage: POObjectPage,
			onTheitemsObjectPage: itemsObjectPage
        },
        async: true
    });

    return runner;
});

