class RaisesController < ApplicationController

  def new
    @raise = Raise.new
  end

  def create
    @raise = Raise.new(params[:raise])
    @raise.is_approved = false
    @raise.user = current_user

    respond_to do |format|
      if @raise.save
        format.html { redirect_to(raises_path, :notice => 'Raise successfully created.') }
        format.xml  { render :xml => raises_path, :status => :created, :location => raises_path }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @raise.errors, :status => :unprocessable_entity }
      end
    end
  end

  def index
    @is_approval = params[:options] == 'approve' 
    if @is_approval && current_user.role.title == 'admin'
      @raises = Raise.where(["is_approved <> ?", true])
    elsif current_user.role.title == 'admin'
      @raises = Raise.all
    else
      if params[:search_raise].present?
        @raises = Raise.where(["user_id = #{current_user.id} and request_amount = #{params[:search_raise]}"])
        #@raises = Raise.where(["user_id = ? and request_amount = ?", current_user, params[:search_raise]])
      else
        @raises = Raise.where(["user_id = ?", current_user])
      end
    end
  end

  def destroy
    @raise = Raise.find(params[:id])
    @raise.destroy

    respond_to do |format|
      format.html { redirect_to(raises_url) }
      format.xml  { head :ok }
    end
  end

  def update
    @raise = Raise.find(params[:id])

    respond_to do |format|
      if @raise.update_attributes(params[:user])
        format.html { redirect_to(@raise, :notice => 'Raise approved.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(@raise, :notice => 'Raise could not be approved. Errors occured.') }
        format.xml  { render :xml => @raise.errors, :status => :unprocessable_entity }
      end
    end
  end

end
