module Vehicles   
    class VehiclesAPI < Grape::API   
     
      format :json   
      
      get do   
        Vehicle.all   
      end   
  
      params do   
        requires :id, type: Integer, desc: "Vehicle id"   
      end   
      get ':id' do   
        begin   
            vehicle = Vehicle.find(params[:id])   
        rescue ActiveRecord::RecordNotFound   
          error!({ status: :not_found }, 404)   
        end   
      end    


      params do   
        requires :id, type: Integer, desc: "Product id"   
      end   
     
      delete ':id' do   
        begin   
            vehicle = Vehicle.find(params[:id])   
          { status: :success } if vehicle.delete   
        rescue ActiveRecord::RecordNotFound   
          error!({ status: :error, message: :not_found }, 404)   
        end   
      end   

     

      params do   
        requires :name, type: String, desc: "Vehicle name"   
        requires :price, type: BigDecimal, desc: "Vehicle price"   
        optional :picture, type: String, desc: "Vehicle picture"   
        optional :created_at, type: String, desc: "Vehicle created date"   
        optional :updated_at, type: String, desc: "Vehicle updated date"   

        
      end   


      post do   
        begin   
          vehicle =  Vehicle.create({   
                                        name: params[:name],   
                                        price: params[:price],   
                                        picture: params[:picture],   
                                        created_at: params[:created],   
                                        updated_at: params[:updated],   

                                          
                                    })   
          if vehicle.save   
            { status: :success }   
          else   
            error!({ status: :error, message: vehicle.errors.full_messages.first }) if vehicle.errors.any?   
          end   
     
     
        rescue ActiveRecord::RecordNotFound   
          error!({ status: :error, message: :not_found }, 404)   
        end   
      end   



      params do   
        
        requires :name, type: String, desc: "Vehicle name"   
        requires :price, type: BigDecimal, desc: "Vehicle price"   
        optional :picture, type: String, desc: "Vehicle picture"   
        
      end   
   
      
      put ':id' do   
        begin   
          vehicle = Vehicle.find(params[:id])   
          if vehicle.update({   
            name: params[:name],   
            price: params[:price],   
            picture: params[:picture],   
            
                            })   
            { status: :success }   
          else   
            error!({ status: :error, message: vehicle.errors.full_messages.first }) if vehicle.errors.any?   
          end   
     
     
        rescue ActiveRecord::RecordNotFound   
          error!({ status: :error, message: :not_found }, 404)   
        end   
      end   









    end 
end 

      
    