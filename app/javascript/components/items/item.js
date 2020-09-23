import React from 'react';
import PropTypes from 'prop-types';
import PhotoGalery from './photo-galery';

class Item extends React.Component {
  render() {
    return (
      <div className="card mb-3">
        <PhotoGalery photos={this.props.item.photos} />

        <div className="card-body">
          <h5 className="card-title">
            {this.props.item.name}
          </h5>
          <h6 className="card-subtitle mb-2 text-muted">
            {this.props.item.price}
          </h6>
          <h6 className="card-subtitle mb-2">
            {this.props.item.stock} in stock
          </h6>
          <p className="card-text">
            Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?
          </p>
          <span className="badge badge-light">#baju</span>
          <span className="badge badge-light">#sendal</span>
          <span className="badge badge-light">#sepatu</span>
          <span className="badge badge-light">#kemeja</span>
        </div>

      </div>
    )
  }
}

Item.propTypes = {
  item: PropTypes.object
};

export default Item;