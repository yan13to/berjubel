import React from "react";
import PropTypes from "prop-types";

class PhotoGalery extends React.Component {
  render() {
    const photoList = this.props.photos.map((photo, index) => {
      const cslName = index == 0 ? "carousel-item active" : "carousel-item";

      return (
        <div className={cslName} key={photo.name + index.toString()}>
          <img src={photo.url} className="d-block-w100"/>
        </div>
      )
    });

    return (
      <div id="carousel-banner" className="carousel" data-ride="carousel">
        <div className="carousel-inner">
          {photoList}
        </div>
      </div>
    )
  }
}

PhotoGalery.propTypes = {
  photos: PropTypes.array
};

export default PhotoGalery;