import React from "react";
import PropTypes from "prop-types";

class Index extends React.Component {
  render () {
    return (<div class="seller">
      <a class="name" href="">{this.props.name}</a>&nbsp;
      <span class="badge">Super Seller</span>
    </div>
    );
  }
}

Index.propTypes = {
  name: PropTypes.string
};

export default Index
