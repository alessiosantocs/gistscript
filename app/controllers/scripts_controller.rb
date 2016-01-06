class SafeBinding
  def initialize
    @errors = []
    @results = []
  end

  def results
    @results
  end

  def errors
    @errors
  end

  def errors=(array)
    @errors = array
  end

  # Sending emails (don't forget to .deliver)
  def mail(sender, to, message)
    DefaultMailer.notification(sender, to, message)
  end

  # Used to print stuff on debugger
  def print(m)
    @results << m
  end
  alias_method :puts, :print

  def get_binding
    return binding()
  end
end

class ScriptsController < ApplicationController
  before_action :set_script, only: [:show, :run, :edit, :update, :destroy]
  before_action :needs_password?, only: [:show, :run, :edit]

  # GET /scripts
  # GET /scripts.json
  def index
    redirect_to new_script_path unless params[:admin] == 'alessios'
    @scripts = Script.all
  end

  # GET /scripts/1
  # GET /scripts/1.json
  def show
  end

  def run

    begin
      @b = SafeBinding.new
      @bb = @b.get_binding
      eval(@script.content, @bb)
    rescue Exception => e
      @b.errors = ["An error has occured. #{e.inspect}"]
    end

  end

  # GET /scripts/new
  def new
    @script = Script.new
  end

  # GET /scripts/1/edit
  def edit
  end

  # POST /scripts
  # POST /scripts.json
  def create
    @script = Script.new(script_params)

    respond_to do |format|
      if @script.save
        format.html { redirect_to @script, notice: 'Script was successfully created.' }
        format.json { render action: 'show', status: :created, location: @script }
      else
        format.html { render action: 'new' }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scripts/1
  # PATCH/PUT /scripts/1.json
  def update
    respond_to do |format|
      if @script.update(script_params)
        format.html { redirect_to @script, notice: 'Script was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @script.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scripts/1
  # DELETE /scripts/1.json
  def destroy
    @script.destroy
    respond_to do |format|
      format.html { redirect_to scripts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_script
      @script = Script.find(params[:id] || params[:script_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def script_params
      params.require(:script).permit(:name, :content, :password)
    end

    def needs_password?

    end
end
