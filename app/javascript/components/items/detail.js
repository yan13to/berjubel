import React from 'react';
import PropTypes from 'prop-types';

class Detail extends React.Component {
  render () {
    return (
      <React.Fragment>
        Item: {this.props.item}
      </React.Fragment>
    );
  }
}

Detail.propTypes = {
  item: PropTypes.object
};

export default Detail;
