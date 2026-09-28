<main class="position-relative z-index-2">
    <div class="container pt-5">
        <div class="row pt-5">
            <div class="col-12 pt-5">
                <h1>$Title</h1>
                <div class="row">
                    <% loop $ExportForm.sort("Produkt, Firma") %>
                        
                            <div class="col-12 col-md-6 col-lg-4 py-3">
                                <h3>$Title</h3>
                                <h4>$Firma</h4>
                                <a href="{$Top.Link}/generateZipArchiveFromMedia/$ID" target="_blank" class="btn btn-primary">Download Data</a>
                            </div>
                        
                    <% end_loop %>
                </div>
            </div>
        </div>
    </div>
</main>