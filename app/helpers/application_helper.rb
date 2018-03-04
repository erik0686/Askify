module ApplicationHelper

    def profileCardMaker(title, data)
        data = '<p class="lead showing">
        <h5 class="showing">' + title + '</h5>
        <div class="card showing">
            <div class="card-body">' + data + '</div>
        </div>
        <p>'
        data.html_safe
    end

    def profileEditableCardMaker(title, data)
        data = '<p class="lead hidden">
        <h5 class="hidden">' + title + '</h5>
        <div class="card hidden">
            <div class="card-body">
                <div class="form-group editProfile">
                    <input type="text" class="form-control editProfile" value="' + data +'"placeholder="First Name">
                </div>
            </div>
        </div>
        <p>'
        data.html_safe
    end

end
