import React from "react";
import PropTypes from "prop-types";

class Index extends React.Component {
  constructor(props) {
    super(props);
    this.state = {hover: false};
  }

  toggleSellerReview = () => this.setState({hover: !this.state.hover})

  render () {
    let showDropdown;

    if (this.state.hover) {
      showDropdown = "dropdown-menu show"
    } else {
      showDropdown = "dropdown-menu"
    }

    return (<div className="seller dropdown popper">
      <a onMouseEnter={this.toggleSellerReview} onMouseLeave={this.toggleSellerReview}>{this.props.name}</a>

      <div className={showDropdown}>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar, erat a vehicula laoreet, turpis elit viverra nibh, ut imperdiet velit quam ut ligula. Aenean congue sapien eu scelerisque gravida. Etiam ex nisi, viverra in blandit ultrices, facilisis nec diam. Mauris mattis nibh purus, ac accumsan nunc maximus sit amet. Vestibulum consequat, lectus sit amet feugiat tempor, diam lectus convallis nisl, nec finibus mi lorem nec felis. Ut nulla velit, feugiat quis velit congue, viverra faucibus felis. Donec sit amet suscipit libero. Morbi condimentum risus sed ipsum congue, eget auctor erat faucibus. Vivamus facilisis, massa sed facilisis rhoncus, quam ante pharetra diam, non hendrerit velit nisi nec felis. Phasellus laoreet est non felis hendrerit, sit amet finibus ipsum sodales. Curabitur ac fermentum arcu. 
        </p>
      </div>
    </div>
    );
  }
}

Index.propTypes = {
  name: PropTypes.string
};

export default Index
