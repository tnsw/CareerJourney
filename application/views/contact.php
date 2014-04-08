    <div class="starter-template">
      <h1>Contact Us</h1>
      <p>Please provide your name, email address and contact number so we can provide feedback to your request.</p>

    </div>    


<div class="col-sm-6 col-sm-offset-3">
      
        <form role="form" method="POST" action="contact-form-submission.php">
            <div class="row">
                <div class="form-group col-lg-4">
                    <label for="input1">Name</label>
                    <input type="text" name="contact_name" class="form-control" id="input1">
                </div>
                <div class="form-group col-lg-4">
                    <label for="input2">Email Address</label>
                    <input type="email" name="contact_email" class="form-control" id="input2">
                </div>
                <div class="form-group col-lg-4">
                    <label for="input3">Phone Number</label>
                    <input type="phone" name="contact_phone" class="form-control" id="input3">
                </div>
                <div class="clearfix"></div>
                <div class="form-group col-lg-12">
                    <label for="input4">Message</label>
                    <textarea name="contact_message" class="form-control" rows="6" id="input4"></textarea>
                </div>
                <div class="form-group col-lg-12">
                    <input type="hidden" name="save" value="contact">
                    <button type="submit" class="btn btn-primary pull-right">Submit</button>
                </div>
            </div>
        </form>
    </div>