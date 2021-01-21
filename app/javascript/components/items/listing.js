import React from 'react';

const API = {
  server: 'http://localhost:3000/',
  baseURL: 'api/v1/'
};

class Listing extends React.Component {
  perPage = 25;
  page = 1;

  state = {
    hasNextPage: true,
    isNextPageLoading: false,
    sortOrder: "asc",
    items: []
  };

  _loadNextPage = (...args) => {
    this.page = (args[0]/this.perPage) + 1;

    fetch(API.server + API.baseURL + "items.json?p="+ this.page +"&pp=" + this.perPage).then(
      response => {
        if (response.ok) {
          return response.json()
        } else {
          throw new Error('Something went wrong..');
        }
      }
    ).then(
      data => this.setState({
        hasNextPage: !(data.items.length < this.perPage),
        isNextPageLoading: false,
        sortOrder: "asc",
        items: [...this.state.items].concat(data.items)
      })
    ).catch(
      error => console.log(error)
    );
  }

  render () {
    const { hasNextPage, isNextPageLoading, items, sortOrder } = this.state;

    return (
      <h1>Berjubel</h1>
    )
  }
}

export default Listing;
