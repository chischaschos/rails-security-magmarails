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
    @raises = Raise.where(["user_id = ? ", current_user])
  end

  def destroy
    @raise = Raise.find(params[:id])
    @raise.destroy

    respond_to do |format|
      format.html { redirect_to(raises_url) }
      format.xml  { head :ok }
    end
  end

end
