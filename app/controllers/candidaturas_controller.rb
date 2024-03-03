class CandidaturasController < ApplicationController
  before_action :set_candidatura, only: %i[ show edit update destroy ]

  # GET /candidaturas or /candidaturas.json
  def index
    @candidaturas = Candidatura.all
  end

  # GET /candidaturas/1 or /candidaturas/1.json
  def show
  end

  # GET /candidaturas/new
  def new
    @candidatura = Candidatura.new
  end

  # GET /candidaturas/1/edit
  def edit
  end

  # POST /candidaturas or /candidaturas.json
  def create
    @candidatura = Candidatura.new(candidatura_params)

    respond_to do |format|
      if @candidatura.save
        format.html { redirect_to candidatura_url(@candidatura), notice: "Candidatura cadastrada com sucesso." }
        format.json { render :show, status: :created, location: @candidatura }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @candidatura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidaturas/1 or /candidaturas/1.json
  def update
    respond_to do |format|
      if @candidatura.update(candidatura_params)
        format.html { redirect_to candidatura_url(@candidatura), notice: "Candidatura editada com sucesso." }
        format.json { render :show, status: :ok, location: @candidatura }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candidatura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidaturas/1 or /candidaturas/1.json
  def destroy
    @candidatura.destroy

    respond_to do |format|
      format.html { redirect_to candidaturas_url, notice: "Candidatura deletada com sucesso." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_candidatura
    @candidatura = Candidatura.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def candidatura_params
    params.require(:candidatura).permit(:mensagem, :candidato_id, :vaga_id, :empregador_id)
  end
end
