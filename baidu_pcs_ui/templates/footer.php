                <div class="col-md-10" id="page_content">
                </div>
            </div>
        </div>
        <footer>
            <div class="container">
                <p>页脚</p>
            </div>
        </footer>
        <script>

            $(document).ajaxSend(function(event, jqxhr, settings) {
                $.isLoading({ text: "Loading" });
            });
            $(document).ajaxComplete(function() {
                $.isLoading( "hide" );
            });
        </script>
    </body>
</html>