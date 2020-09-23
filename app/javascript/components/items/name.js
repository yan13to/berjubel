import React from "react";
import PropTypes from "prop-types";

class Name extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      hover: false
    };

    this.toggleSellerReview = this.toggleSellerReview.bind(this);
  }

  toggleSellerReview = () => this.setState((state) => ({hover: !state.hover}));

  render() {
    const showDropdown = this.state.hover ? "dropdown-menu show" : "dropdown-menu";

    return (
      <div className="seller dropdown popper">
        <a onMouseEnter={this.toggleSellerReview} onMouseLeave={this.toggleSellerReview}>{this.props.name}</a>

        <div className={showDropdown}>
          <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar, erat a vehicula laoreet, turpis elit viverra nibh, ut imperdiet velit quam ut ligula.
          </p>
        </div>
      </div>
    )
  }
}

Name.propTypes = {
  name: PropTypes.string
};

export default Name