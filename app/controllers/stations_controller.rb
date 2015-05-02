class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy, :claim]

  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.joins(:flow_readings).order('flow_readings.flow_rate DESC').uniq.paginate(page: params[:page])

    @hash = Gmaps4rails.build_markers(@stations) do |station, marker|
      marker.lat station.latitude.to_f
      marker.lng station.longitude.to_f
      marker.infowindow render_to_string(:partial => "/layouts/partials/infowindow", :locals => { :station  => station})
    end
  end





  # GET /stations/1
  # GET /stations/1.json
  def show
    @hash = Gmaps4rails.build_markers(@station) do |station, marker|
      marker.lat station.latitude.to_f
      marker.lng station.longitude.to_f
      marker.infowindow station.name + "&nbsp;&nbsp;&nbsp;"
    end
    @dates = Date.today..(Date.today+7.days)
  end

  # GET /stations/new
  def new
    @station = Station.new
  end

  def claim
    if current_user
      @favorite_station = FavoriteStation.new
      @favorite_station.user_id = current_user.id
      @favorite_station.station_id = @station.id
      @favorite_station.save
      redirect_to root_path,
        notice: "Station has been added to your favorites"
    else
      redirect_to new_user_path,
      notice: "You must be logged in to choose a favorite"
    end
   # @station.favorite(current_user)


      # if current_user
      # binding.pry
      # current_user.favorite_station << @stations
      # redirect_to root_path, notice: "#{@favorite_station} has been added to your list"
      # end
  end

# Station.find(params['id']) find a station with a given ID
  # if not found - return a message 'Station not found / error message'
  # if it is found, then it ads the found station to 'favorite stations'
  # when adding found station to 'favorite stations'
  # user ID comes from = current_user
  # station ID comes from = found station (.find gave us this ID)
  # if it works return "Success!"
  # if not, return "unable to claim"

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(station_params)

    respond_to do |format|
      if @station.save
        format.html { redirect_to @station, notice: 'Station was successfully created.' }
        format.json { render :show, status: :created, location: @station }
      else
        format.html { render :new }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to @station, notice: 'Station was successfully updated.' }
        format.json { render :show, status: :ok, location: @station }
      else
        format.html { render :edit }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end
end

private
# Use callbacks to share common setup or constraints between actions.
def set_station
  @station = Station.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def station_params
  params.require(:station).permit(:name, :latitude, :longitude)
end
