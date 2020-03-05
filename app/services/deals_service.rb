class DealsService < ApplicationService
    API_KEY="G5mZccexXgchNkAYOBlQ"
    BASE_PATH="https://api.pipelinedeals.com/api/v3/"

    def call
        response = RestClient.get BASE_PATH+"deals.json", { params: { api_key: API_KEY }}
        body = JSON.parse(response.body)
        deals = body.entries[0][1]
        update_db(deals)
    end

    def update_db(deals)
        Deal.destroy_all
        for i in 0..(deals.count-1)
            Deal.create( value: deals[i]['value'], percent: deals[i]['deal_stage']['percent'])
        end
    end

end
