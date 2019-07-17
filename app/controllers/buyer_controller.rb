class BuyerController < ApplicationController
    def page
        @vinyl = Vinyl.find(params[:vinyl_id])
        @seller = Seller.find(params[:seller_id])
      end
    
      def payment
        
        @buyer = Buyer.find_by(profile_id: current_user.profile.id)
        @vinyl = Vinyl.find(params[:vinyl_id])
        @buyer.vinyl << @vinyl
        @seller = @vinyl.seller
        @buyer.sellers << @seller
       
        # @selle`r = @car.seller
       
        # @buyer.seller << @seller
        #redirect back to the car showpage
        redirect_to @vinyl, notice: "payment successful"
      end
    end
    

end
