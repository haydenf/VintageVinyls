class BuyerController < ApplicationController
    def page
        @vinyl = Vinyl.find(params[:vinyl_id])
        @seller = Seller.find(params[:seller_id])
      end
    
      def payment

        
        @buyer = Buyer.find_by(profile_id: current_user.profile.id)
        @vinyl = Vinyl.find(params[:vinyl_id])
        @buyer.vinyl_ids << @vinyl
        @seller = @vinyl.seller
        @buyer.seller_ids << @seller
       
     
       
        redirect_to @vinyl, notice: "payment successful"
      end
    end
    


