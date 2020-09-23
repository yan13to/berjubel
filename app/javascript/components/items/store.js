import React from 'react';
import PropTypes from 'prop-types';
import Name from './name';

class Store extends React.Component {
  render() {
    return (
      <div className="d-flex">
        <div className="p-2">
          <img src={this.props.store.avatar.url}></img>
        </div>
        <div className="p-2">
          <Name name={this.props.store.name} />
        </div>
        <div className="p-2 ml-auto dropdown">
          <a href="#" data-toggle="dropdown">
            <i className="material-icons">more_horiz</i>
          </a>
          <div className="dropdown-menu">
            <a className="dropdown-item">Follow</a>
            <a className="dropdown-item">Block</a>
          </div>
        </div>
      </div>
    )
  }
}

Store.propTypes = {
  store: PropTypes.object
};

export default Store;