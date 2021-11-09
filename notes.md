### FIRST PART making migration for Design
 * what columns do i need for it
 
 # making model for Design 
 * adding a few model methods to design later on will change those methods... 

 ###  2ND PART routes (CRUD)
 * index (1: find all designs)
 * show (1: find one design from params DUES all find from params )
 * new and create together 
     - new (create a new design so it opens up the form)
     - create (1: design.new based on the params we have given it to them, to give right access to user
               2: if design was saved based on validations we given then redirect it to design itself
               3: if not saved due to validation or anything give some flash messages. and render :new. )

* edit and update together
    - DUES destroy edit and update and show all finds design from params
    - edit first finds it to open form for us
    - then once forms is filled (1: first finds it in update 
                                 2: updates it based design params
                                 3: AR if its valid it checks it, then redirects it to design itself
                                 4: if not valid, gives some flash messages and render :edit)
* destroy
    - to destroy (1: first find it 
                  2: then destroy it
                  3: redirect it back to designs
                  4: and in any form, just link it to design_path and add a method of delete to it.)

#### THIRD PART VALIDATIONS 
* search : using form_with but with tag form of it, in tag we use url
         : in search we look it from params and then saves it to @designs and since we have @design already we only render index which is similar to any new form for it

* where to validate
 - mvc
   - if in view: it can easily be removed by user in inspect
   - if in controller: if params[:description] == "" render ... it works but no more logic in controller 
   - if in model: its perfect there            
