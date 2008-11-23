class ContactsController < ApplicationController
  # GET /contacts
  def index
    @contacts = Contact.find(:all)
  end

  # GET /contacts/1
  def show
    @contact = Contact.find(params[:id])
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  def create
    @contact = Contact.new(params[:contact])

    if @contact.save
      flash[:notice] = 'Contact was successfully created.'
      redirect_to @contact
    else
      render :action => "new"
    end
  end

  # PUT /contacts/1
  def update
    @contact = Contact.find(params[:id])

    if @contact.update_attributes(params[:contact])
      flash[:notice] = 'Contact was successfully updated.'
      redirect_to @contact
    else
      render :action => "edit"
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_url
  end

  def lookup_zip
    if params[:zip].size == 5
    	entry = Zipcode.find_by_zipcode(params[:zip], :limit => 1)
    	@csp = { :city => entry.city, :state => entry.state, :parish => entry.county }
    else
        @csp = { :city => 'NOT FOUND', :state => 'NOT FOUND', :parish => 'NOT FOUND' }
    end
  end

end
